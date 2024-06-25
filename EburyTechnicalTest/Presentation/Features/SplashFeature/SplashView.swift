//
//  SplashView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var vm: SplashViewModel
    private var onLoaded: ([(Currency, Double)]) -> Void
    
    init(vm: SplashViewModel, onLoaded: @escaping ([(Currency, Double)]) -> Void) {
        self._vm = StateObject(wrappedValue: vm)
        self.onLoaded = onLoaded
    }
    
    var body: some View {
        ZStack {
            Image(.splash)
                .resizable()
                .ignoresSafeArea()
            
            Text("App Test")
                .font(.largeTitle)
                .foregroundStyle(Color(.onBackground))
            
            ProgressView()
                .tint(Color(.onBackground))
                .padding(.top, 80)
        }
        .onAppear {
            vm.load()
        }
        .onChange(of: vm.done) { _, _ in
            onLoaded(vm.amounts)
        }
    }
}

#Preview {
    SplashView(vm: SplashViewModel(useCase: HomeUseCaseMock.preview)) { _ in
        print("done")
    }
}
