//
//  HomeView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import SwiftUI

struct HomeTabView: View {
    @StateObject private var vm: HomeTabViewModel
    @State private var offset = CGSize.zero
    
    init(vm: HomeTabViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.backgroundGradient1, .backgroundGradient2],
                           startPoint: .leading,
                           endPoint: .trailing)
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    activeHeader()
                }
                .background {
                    Image(.homeClouds)
                        .resizable()
                        .scaledToFill()
                }
                
                HStack {
                    activeTab()
                }
                .background {
                    Color(.surfaceVariant)
                        .clipShape(.rect(topLeadingRadius: 24, topTrailingRadius: 24))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, -20)
                }
                
                HStack {
                    Button {
                        withAnimation {
                            vm.tabPressed(.home)
                        }
                    } label: {
                        HStack {
                            Spacer()
                            VStack {
                                Image(.wallet)
                                    .renderingMode(.template)
                                
                                Text("Home")
                                    .font(.caption)
                            }
                            .foregroundStyle(vm.tab == .home ? .onSurfaceSelected : .onSurfaceLowEmphasis)
                            Spacer()
                        }
                    }
                    
                    Button {
                        withAnimation {
                            vm.tabPressed(.products)
                        }
                    } label: {
                        HStack {
                            Spacer()
                            VStack {
                                Image(.star)
                                    .renderingMode(.template)
                                
                                Text("Products")
                                    .font(.caption)
                            }
                            .foregroundStyle(vm.tab == .products ? .onSurfaceSelected : .onSurfaceLowEmphasis)
                            Spacer()
                        }
                    }
                }
                .padding()
                .background {
                    Color(.surface)
                        .clipShape(.rect(topLeadingRadius: 10, topTrailingRadius: 10))
                        .shadow(radius: 10)
                        .ignoresSafeArea()
                }
            }
        }
        .onAppear {
            UIRefreshControl.appearance().tintColor = .onBackground
        }
        .sheet(isPresented: $vm.isViewAll, content: {
            ZStack {
                Color.surfaceVariant
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    HStack {
                        Text("All currencies")
                            .font(.title)
                            .padding()
                            .bold()
                            .foregroundStyle(.onBackground)
                        Spacer()
                    }
                    .background {
                        LinearGradient(colors: [.backgroundGradient2, .backgroundGradient1],
                                       startPoint: .leading,
                                       endPoint: .trailing)
                    }
                    
                    ScrollView {
                        WalletListView(currencies: vm.allCurrencies)
                            .padding()
                    }
                }
            }
        })
    }
    
    // MARK: - Functions
    
    @ViewBuilder
    func activeTab() -> some View {
        if vm.tab == .home {
            WalletView(vm: WalletViewModel(currencies: vm.currencies)) {
                vm.viewAllButtonPressed()
            }
            .padding(.bottom, 60)
        } else {
            ProductsView()
        }
    }
    
    @ViewBuilder
    func activeHeader() -> some View {
        if vm.tab == .home {
            VStack(alignment: .leading) {
                Button {
                    vm.profileButtonPresssed()
                } label: {
                    Image(.user)
                        .renderingMode(.template)
                        .foregroundStyle(.onBackground)
                }
                
                ScrollView {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Welcome")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.onBackground)
                            Text("Company Name")
                                .font(.footnote)
                                .foregroundStyle(.onBackground)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, UIScreen.main.bounds.height / 20)
                }
                .scrollIndicators(.hidden)
                .refreshable {
                    await vm.refreshData()
                }
            }
            .padding()
        } else {
            HStack {
                Text("Products")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.onBackground)
                
                Spacer()
            }
            .padding()
            .padding(.vertical, 30)
        }
    }
}

// MARK: - Preview

#Preview {
    HomeTabView(vm: HomeTabViewModel(currencies: [(Currency(iso: "USD", name: "US Dolars"), 50000.50),
                                                  (Currency(iso: "EUR", name: "Euro"), 8000.00),
                                                  (Currency(iso: "GBP", name: "British Pound"), 20000.00)],
                                     useCase: HomeUseCaseMock.preview))
}
