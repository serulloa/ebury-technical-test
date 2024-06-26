//
//  HomeUseCaseImpl.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

struct HomeUseCaseImpl: HomeUseCase {
    private let repository: WalletRepository
    
    init(repository: WalletRepository) {
        self.repository = repository
    }
    
    /// Gets the amounts in the wallets, with its currencies.
    /// - Returns: A tuple array, as this is easier to handle by the presentation layer.
    func getAmounts() async throws -> [(currency: Currency, amount: Double)] {
        let wallets = try await repository.getWallets()
        let amounts = wallets.map { ($0.currency, $0.amount) }
        return amounts
    }
}
