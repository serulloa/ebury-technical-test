//
//  MainView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

import SwiftUI

struct MainView: View {
    @State private var isLoaded = false
    
    var body: some View {
        if isLoaded {
            HomeTabView(vm: HomeTabViewModel())
        } else {
            SplashView(vm: SplashViewModel()) {
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
