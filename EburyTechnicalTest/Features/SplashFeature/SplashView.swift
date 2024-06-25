//
//  SplashView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var vm: SplashViewModel
    private var onLoaded: () -> Void
    
    init(vm: SplashViewModel, onLoaded: @escaping () -> Void) {
        self._vm = StateObject(wrappedValue: vm)
        self.onLoaded = onLoaded
    }
    
    var body: some View {
        ZStack {
            Image(.splash)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("App Test")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color(.onBackground))
                
                ProgressView()
                    .tint(Color(.onBackground))
            }
        }
        .onAppear {
            vm.load()
        }
        .onChange(of: vm.done) { _, _ in
            onLoaded()
        }
    }
}

#Preview {
    SplashView(vm: SplashViewModel()) {
        print("done")
    }
}
