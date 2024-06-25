//
//  HomeTabAssembly.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

struct UseCasesAssembly {
    static func home() -> HomeUseCase {
        let apiClient = APIClient()
        let datasource = WalletDatasource(apiClient: apiClient)
        let repository = WalletRepositoryImpl(datasource: datasource)
        return HomeUseCaseImpl(repository: repository)
    }
}
