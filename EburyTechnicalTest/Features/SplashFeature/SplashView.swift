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
                    .bold()
                    .foregroundStyle(Color(.onBackground))
                
                ProgressView()
                    .tint(Color(.onBackground))
            }
        }
    }
}

#Preview {
    SplashView()
}
