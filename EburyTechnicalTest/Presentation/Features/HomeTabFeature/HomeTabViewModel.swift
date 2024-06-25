//
//  HomeTabViewModel.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import Combine

class HomeTabViewModel: ObservableObject {
    @Published var tab: Tab = .home
    @Published var currencies: [(Currency, Double)]
    @Published var isViewAll = false
    
    @Published var allCurrencies: [(Currency, Double)] {
        didSet {
            currencies = Array(allCurrencies.prefix(3))
        }
    }
    
    private var useCase: HomeUseCase
    
    init(currencies: [(Currency, Double)], useCase: HomeUseCase) {
        self.allCurrencies = currencies
        self.currencies = Array(currencies.prefix(3))
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
    func viewAllButtonPressed() {
        isViewAll = true
    }
    
    @MainActor
    func refreshData() async {
        do {
            allCurrencies = try await useCase.getAmounts()
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
