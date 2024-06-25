//
//  HomeTabViewModel.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import Combine

class HomeTabViewModel: ObservableObject {
    @Published var tab: Tab = .home
    @Published var wallets: [(Currency, Double)]
    
    private var amounts: [(Currency, Double)] {
        didSet {
            wallets = Array(amounts.prefix(3))
        }
    }
    
    private var useCase: HomeUseCase
    
    init(amounts: [(Currency, Double)], useCase: HomeUseCase) {
        self.amounts = amounts
        self.wallets = Array(amounts.prefix(3))
        self.useCase = useCase
    }
    
    @MainActor
    func tabPressed(_ tab: Tab) {
        self.tab = tab
    }
    
    func profileButtonPresssed() {
        // TODO
    }
    
    @MainActor
    func refreshData() async {
        do {
            amounts = try await useCase.getAmounts()
        } catch {
            print(error)
        }
    }
}

extension HomeTabViewModel {
    enum Tab {
        case home
        case products
    }
}
