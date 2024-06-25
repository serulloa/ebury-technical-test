//
//  WalletListView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 26/6/24.
//

import SwiftUI

struct WalletListView: View {
    private let currencies: [(currency: Currency, amount: Double)]
    
    init(currencies: [(currency: Currency, amount: Double)]) {
        self.currencies = currencies
    }
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(currencies, id: \.currency.iso) { item in
                CurrencyView(currency: item.currency,
                             quantity: item.amount,
                             flag: flag(iso: item.currency.iso))
                .padding()
                .background {
                    Color.surface
                        .clipShape(.rect(cornerRadius: 8))
                        .shadow(color: .black.opacity(0.2), radius: 10, y: 10)
                }
            }
        }
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
    WalletListView(currencies: [
        (Currency(iso: "USD", name: "US Dolars"), 50000.50),
        (Currency(iso: "EUR", name: "Euro"), 8000.00),
        (Currency(iso: "GBP", name: "British Pound"), 20000.00)
    ])
}
