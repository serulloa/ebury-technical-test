//
//  WalletRepository.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

protocol WalletRepository {
    func getWallets() async throws -> [Wallet]
}
