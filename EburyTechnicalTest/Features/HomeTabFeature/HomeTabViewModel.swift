//
//  HomeTabViewModel.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 24/6/24.
//

import Combine

class HomeTabViewModel: ObservableObject {
    @Published var tab: Tab = .home
    
    func tabPressed(_ tab: Tab) {
        self.tab = tab
    }
    
    func profileButtonPresssed() {
        // TODO
    }
    
    func refreshData() async {
        // TODO
        try? await Task.sleep(nanoseconds: 3_000_000_000)
    }
}

extension HomeTabViewModel {
    enum Tab {
        case home
        case products
    }
}
