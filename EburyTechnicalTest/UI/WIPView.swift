//
//  WIPView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

import SwiftUI

struct WIPView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(.comingSoon)
                .padding(.bottom)
            
            Text("Coming soon")
                .font(.title3)
                .foregroundStyle(.onSurfaceHighEmphasis)
            Text("We are currently working in more features to offer the best experience")
                .foregroundStyle(.onSurfaceLowEmphasis)
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    WIPView()
}
