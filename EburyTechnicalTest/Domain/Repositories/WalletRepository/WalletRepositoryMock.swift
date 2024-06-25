//
//  WalletRepositoryMock.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

struct WalletRepositoryMock: WalletRepository {
    var _getWallets: () async throws -> [Wallet]
    
    init(_getWallets: @escaping () -> [Wallet]) {
        self._getWallets = _getWallets
    }
    
    func getWallets() async throws -> [Wallet] {
        return try await _getWallets()
    }
}

extension WalletRepositoryMock {
    static func test() -> WalletRepositoryMock {
        return .init {
            []
        }
    }
}
