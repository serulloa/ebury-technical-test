//
//  WalletRepositoryImpl.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

struct WalletRepositoryImpl: WalletRepository {
    private let datasource: WalletDatasource
    
    init(datasource: WalletDatasource) {
        self.datasource = datasource
    }
    
    func getWallets() async throws -> [Wallet] {
        return try await datasource.getWallets().map { WalletMapper.map($0) }
    }
}
