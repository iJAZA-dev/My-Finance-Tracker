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
    
    private let client: APIClientProtocol
    private let bundleFileName = "exchangeRate"

    init(client: APIClientProtocol = APIClient.shared) {
        self.client = client
    }
    
    func fetchExchangeRates() async throws -> [ExchangeRateModel] {
        guard let url = Bundle.main.url(forResource: bundleFileName, withExtension: "json") else {
            throw NetworkError.invalidURL
        }
        
        do {
            let data = try await client.fetchData(from: url)
            let decoded = try JSONDecoder().decode([ExchangeRateModel].self, from: data)
            return decoded
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}


