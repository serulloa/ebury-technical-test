//
//  CurrencyView.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import SwiftUI

struct CurrencyView: View {
    private let currency: Currency
    private let flag: Image
    private let quantity: Double
    
    init(currency: Currency, quantity: Double, flag: Image) {
        self.currency = currency
        self.flag = flag
        self.quantity = quantity
    }
    
    var body: some View {
        HStack {
            flag
                .resizable()
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading) {
                Text(currency.iso)
                    .font(.headline)
                
                Text(currency.name)
                    .font(.subheadline)
                    .foregroundStyle(.onSurfaceLowEmphasis)
            }
            
            Spacer()
            
            Text(quantity.formatted(.number.precision(.fractionLength(2))))
                .font(.title3)
                .bold()
        }
        .foregroundStyle(.onSurfaceHighEmphasis)
    }
}

#Preview {
    CurrencyView(currency: .init(iso: "USD", name: "US Dolars"),
                 quantity: 50000.50,
                 flag: .init(systemName: "globe"))
}
