//
//  ExchangeRateService.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import Foundation

import Foundation

protocol ExchangeRateServiceProtocol {
    func fetchExchangeRates() async throws -> [ExchangeRateModel]
}

final class ExchangeRateService: ExchangeRateServiceProtocol {
    func fetchExchangeRates() async throws -> [ExchangeRateModel] {
        guard let url = Bundle.main.url(forResource: "exchangeRate", withExtension: "json") else {
            throw NetworkError.invalidURL
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([ExchangeRateModel].self, from: data)
            return decoded
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}


