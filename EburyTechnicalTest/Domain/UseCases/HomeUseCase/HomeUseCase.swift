//
//  HomeUseCase.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

protocol HomeUseCase {
    func getAmounts() async throws -> [(currency: Currency, amount: Double)]
}
