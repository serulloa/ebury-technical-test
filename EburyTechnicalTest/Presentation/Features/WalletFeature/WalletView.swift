//
//  WalletView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import SwiftUI

struct WalletView: View {
    @StateObject private var vm: WalletViewModel
    private let onViewAll: () -> Void
    
    init(vm: WalletViewModel, onViewAll: @escaping () -> Void) {
        self._vm = StateObject(wrappedValue: vm)
        self.onViewAll = onViewAll
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Your currencies")
                    .font(.headline)
                    .foregroundStyle(.onSurfaceHighEmphasis)
                
                Spacer()
                
                Button {
                    onViewAll()
                } label: {
                    Text("View all")
                }
                .tint(.onSurfaceSelected)
            }
            
            WalletListView(currencies: vm.currencies)
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color.surfaceVariant
            .ignoresSafeArea()
        
        WalletView(vm: WalletViewModel(currencies: [
            (Currency(iso: "USD", name: "US Dolars"), 50000.50),
            (Currency(iso: "EUR", name: "Euro"), 8000.00),
            (Currency(iso: "GBP", name: "British Pound"), 20000.00)
        ])) {
            print("view all")
        }
    }
}
