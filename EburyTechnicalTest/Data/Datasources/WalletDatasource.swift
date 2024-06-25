//
//  WalletDatasource.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

struct WalletDatasource {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getWallets() async throws -> [WalletDataModel] {
        return try await apiClient.send(endpoint: .getWallets)
    }
}
