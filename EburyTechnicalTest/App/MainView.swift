//
//  MainView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

import SwiftUI

struct MainView: View {
    @State private var isLoaded = false
    @State private var amounts: [(Currency, Double)] = []
    
    var body: some View {
        if isLoaded {
            HomeTabView(vm: HomeTabViewModel(currencies: amounts, useCase: UseCasesAssembly.home()))
        } else {
            SplashView(vm: SplashViewModel(useCase: UseCasesAssembly.home())) { amounts in
                self.amounts = amounts
                
                withAnimation {
                    isLoaded = true
                }
            }
        }
    }
}

#Preview {
    MainView()
}
