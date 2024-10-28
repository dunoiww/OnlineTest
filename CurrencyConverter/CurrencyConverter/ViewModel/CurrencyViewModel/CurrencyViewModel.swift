//
//  CurrencyViewModel.swift
//  CurrencyConverter
//
//  Created by Ngô Nam on 23/10/2024.
//

import Foundation
import Combine
import SwiftUI

class CurrencyViewModel: ObservableObject {
    @Published var amount: String = ""
    @Published var fromCurrency: String = ""
    @Published var toCurrency: String = ""
    @Published var result: Double = 0.0
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    @Published var currencies: [String] = []
    @Published var isLoading: Bool = false
    @Published var exchangeRate: [String: Double] = [:]

    private let apiKey = "711168a0d22e5808dae182908001ad9d"
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Fetch Exchange Rates
    func fetchExchangeRate() {
        guard let url = URL(string: "https://api.exchangeratesapi.io/v1/latest?access_key=\(apiKey)") else {
            showError(with: "Invalid URL")
            return
        }
        
        isLoading = true

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ExchangeRateResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false

                if case .failure = completion {
                    self?.showError(with: "Error fetching exchange rates.")
                }
            }, receiveValue: { [weak self] response in
                self?.currencies = Array(response.rates.keys).sorted()
                self?.exchangeRate = response.rates
                self?.fromCurrency = self?.currencies[0] ?? ""
                self?.toCurrency = self?.currencies[0] ?? ""
            })
            .store(in: &cancellables)
    }

    // MARK: - Convert Currency
    func convertCurrency() {
        guard let fromRate = exchangeRate[fromCurrency],
              let toRate = exchangeRate[toCurrency] else {
            showError(with: "Please select a valid currencies!")
            return
        }
        guard let amountValue = Double(amount) else {
            showError(with: "Invalid amount format.")
            return
        }

        let model = CurrencyModel(fromCurrency: fromCurrency, toCurrency: toCurrency, amount: amountValue)
        result = model.convert(rate: toRate / fromRate)
    }

    // MARK: - Show Error
    private func showError(with message: String) {
        errorMessage = message
        showError = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                self.showError = false
            }
        }
    }
}
