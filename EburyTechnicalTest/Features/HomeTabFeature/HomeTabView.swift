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
        VStack(spacing: 0) {
            ZStack {
                ZStack(alignment: .bottom) {
                    LinearGradient(colors: [.backgroundGradient1, .backgroundGradient2],
                                   startPoint: .leading,
                                   endPoint: .trailing)
                    .ignoresSafeArea()
                    
                    Image(.homeClouds)
                }
                
                activeHeader()
            }
            
            activeTab()
                .background {
                    Color(.surfaceVariant)
                        .clipShape(.rect(cornerRadius: 10))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, -20)
                }
            
            
            HStack {
                Button {
                    vm.tabPressed(.home)
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
                    vm.tabPressed(.products)
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
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 10)
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            UIRefreshControl.appearance().tintColor = .onBackground
        }
    }
    
    // MARK: - Functions
    
    @ViewBuilder
    func activeTab() -> some View {
        if vm.tab == .home {
            WalletView(vm: WalletViewModel(currencies: [
                (Currency(iso: "USD", name: "US Dolars"), 50000.50),
                (Currency(iso: "EUR", name: "Euro"), 8000.00),
                (Currency(iso: "GBP", name: "British Pound"), 20000.00)
            ]))
            .padding(.bottom, 60)
            
        } else {
            Text("adios")
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
                
                Spacer()
                
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
                    
                    .padding(.top, 60)
                }
                .refreshable {
                    await vm.refreshData()
                }
            }
            .padding()
        } else {
            Text("Products")
                .font(.title)
                .bold()
                .foregroundStyle(.onBackground)
        }
    }
}

// MARK: - Preview

#Preview {
    HomeTabView(vm: HomeTabViewModel())
}
