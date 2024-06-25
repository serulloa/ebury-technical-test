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
    
    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(3)) {
            self.done = true
        }
    }
}
