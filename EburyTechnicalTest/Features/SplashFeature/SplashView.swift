//
//  SplashView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image(.splash)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("App Test")
                    .font(.largeTitle)
                    .foregroundStyle(Color(.onBackground))
                
                ProgressView()
            }
        }
    }
}

#Preview {
    SplashView()
}
