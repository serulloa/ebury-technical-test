//
//  HomeUseCaseTests.swift
//  EburyTechnicalTestTests
//
//  Created by Sergio Ulloa López on 25/6/24.
//

import XCTest
@testable import EburyTechnicalTest

final class HomeUseCaseTests: XCTestCase {
    var sut = HomeUseCaseImpl(repository: WalletRepositoryMock.test())
    
    func testGetAmountsSuccess() async throws {
        let expectation = expectation(description: "WalletRepositoryMock.getWallets should be called")
        let wallets = [Wallet(id: "1", company: "", currency: .init(iso: "1", name: "One"), amount: 1),
                       Wallet(id: "2", company: "", currency: .init(iso: "2", name: "Two"), amount: 2)]
        
        var repository = WalletRepositoryMock.test()
        repository._getWallets = {
            expectation.fulfill()
            return wallets
        }
        sut = .init(repository: repository)
        
        let result = try await sut.getAmounts()
        
        await fulfillment(of: [expectation])
        XCTAssertEqual(result.count, 2)
        
        for index in 0..<2 {
            XCTAssertEqual(result[index].currency.iso, wallets[index].currency.iso)
            XCTAssertEqual(result[index].currency.name, wallets[index].currency.name)
            XCTAssertEqual(result[index].amount, wallets[index].amount)
        }
    }
    
    func testGetAmountSuccessEmpty() async throws {
        let expectation = expectation(description: "WalletRepositoryMock.getWallets should be called")
        
        var repository = WalletRepositoryMock.test()
        repository._getWallets = {
            expectation.fulfill()
            return []
        }
        sut = .init(repository: repository)
        
        let result = try await sut.getAmounts()
        
        await fulfillment(of: [expectation])
        XCTAssert(result.isEmpty)
    }
    
    func testGetAmountError() async {
        let expectation = expectation(description: "WalletRepositoryMock.getWallets should be called")
        
        var repository = WalletRepositoryMock.test()
        repository._getWallets = {
            expectation.fulfill()
            throw MockError()
        }
        sut = .init(repository: repository)
        
        do {
            _ = try await sut.getAmounts()
            XCTFail()
        } catch {
            if error is MockError {
                XCTAssert(true)
            } else {
                XCTFail()
            }
        }
        
        await fulfillment(of: [expectation])
    }
}
