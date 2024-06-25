//
//  HomeUseCaseMock.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

struct HomeUseCaseMock: HomeUseCase {
    var _getAmounts: () async throws -> [(currency: Currency, amount: Double)]
    
    init(_getAmounts: @escaping () -> [(currency: Currency, amount: Double)]) {
        self._getAmounts = _getAmounts
    }
    
    func getAmounts() async throws -> [(currency: Currency, amount: Double)] {
        return try await _getAmounts()
    }
}

extension HomeUseCaseMock {
    static let preview = Self {
        return [
            (Currency(iso: "USD", name: "US Dolars"), 50000.50),
            (Currency(iso: "EUR", name: "Euro"), 8000.00),
            (Currency(iso: "GBP", name: "British Pound"), 20000.00)
        ]
    }
}
