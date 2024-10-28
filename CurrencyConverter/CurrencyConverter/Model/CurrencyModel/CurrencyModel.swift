//
//  CurrencyModel.swift
//  CurrencyConverter
//
//  Created by Ngô Nam on 23/10/2024.
//

import Foundation

struct ExchangeRateResponse: Decodable, Encodable {
    let rates: [String: Double]
    let base: String
    
    static let placeholder = ExchangeRateResponse(rates: [:], base: "EUR")
}

struct CurrencyModel {
    var fromCurrency: String
    var toCurrency: String
    var amount: Double
    
    func convert(rate: Double) -> Double {
        return amount * rate
    }
}
