//
//  SplashViewModel.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

import Foundation
import Combine

class SplashViewModel: ObservableObject {
    @Published var done = false
    @Published var amounts: [(Currency, Double)] = []
    private let useCase: HomeUseCase
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    @MainActor
    func load() {
        Task {
            amounts = try await useCase.getAmounts()
            done = true
        }
    }
}
