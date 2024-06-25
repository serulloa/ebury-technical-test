//
//  WalletView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import SwiftUI

struct WalletView: View {
    @StateObject private var vm: WalletViewModel
    
    init(vm: WalletViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Your currencies")
                    .font(.headline)
                    .foregroundStyle(.onSurfaceHighEmphasis)
                
                Spacer()
                
                Button {
                    // TODO
                } label: {
                    Text("View all")
                }
                .tint(.onSurfaceSelected)
            }
            
            ForEach(vm.currencies, id: \.currency.iso) { item in
                CurrencyView(currency: item.currency,
                             quantity: item.quantity,
                             flag: flag(iso: item.currency.iso))
                .padding()
                .background {
                    Color.surface
                        .clipShape(.rect(cornerRadius: 8))
                        .shadow(color: .black.opacity(0.2), radius: 10, y: 10)
                }
            }
        }
        .padding()
    }
    
    private func flag(iso: String) -> Image {
        if let image = UIImage(named: iso) {
            return Image(uiImage: image)
        } else {
            return Image(systemName: "globe")
        }
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
        ]))
    }
}
