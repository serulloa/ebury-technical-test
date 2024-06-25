//
//  WalletViewModel.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import Combine

class WalletViewModel: ObservableObject {
    @Published var currencies: [(currency: Currency, amount: Double)]
    
    init(currencies: [(currency: Currency, amount: Double)]) {
        self.currencies = currencies
    }
}
