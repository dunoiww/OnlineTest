//
//  CurrencyConverterTests.swift
//  CurrencyConverterTests
//
//  Created by Ngô Nam on 23/10/2024.
//

import XCTest
import Combine
@testable import CurrencyConverter

final class CurrencyConverterTests: XCTestCase {
    var viewModel: CurrencyViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        super.setUp()
        viewModel = CurrencyViewModel()
        cancellables = []
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchExchangeRate_Success() {
        let expectation = XCTestExpectation(description: "Fetch exchange rates")
        
        viewModel.$currencies
            .dropFirst()
            .sink { currencies in
                XCTAssertFalse(currencies.isEmpty, "Currencies should not be empty")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        viewModel.fetchExchangeRate()
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testConvertCurrency_Success() {
        viewModel.exchangeRate = ["USD": 1.0, "EUR": 0.85]
        viewModel.fromCurrency = "USD"
        viewModel.toCurrency = "EUR"
        viewModel.amount = "100"
        
        viewModel.convertCurrency()
        
        XCTAssertEqual(viewModel.result, 85.0, "Conversion result should be 85.0")
    }
    
    func testConvertCurrency_InvalidAmount() {
        viewModel.exchangeRate = ["USD": 1.0, "EUR": 0.85]
        viewModel.fromCurrency = "USD"
        viewModel.toCurrency = "EUR"
        viewModel.amount = "invalid"
        
        viewModel.convertCurrency()
        
        XCTAssertTrue(viewModel.showError, "Error should be shown for invalid amount")
        XCTAssertEqual(viewModel.errorMessage, "Invalid amount format.", "Expected error message: Invalid amount format.")
    }
    
    func testConvertCurrency_MissingExchangeRate() {
        viewModel.exchangeRate = [:]
        viewModel.fromCurrency = "USD"
        viewModel.toCurrency = "EUR"
        viewModel.amount = "100"
        
        viewModel.convertCurrency()
        
        XCTAssertTrue(viewModel.showError, "Error should be shown for missing exchange rate")
        XCTAssertEqual(viewModel.errorMessage, "Please select a valid currencies!", "Expected error message: Please select a valid currencies!")
    }
}
