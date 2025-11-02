//
//  TransactionService.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import Foundation

protocol TransactionServiceProtocol {
    func fetchTransactions() async throws -> [TransactionModel]
}

final class TransactionService: TransactionServiceProtocol {
    
    private let client: APIClientProtocol
    private let bundleFileName = "transaction"

    init(client: APIClientProtocol = APIClient.shared) {
        self.client = client
    }
    
    func fetchTransactions() async throws -> [TransactionModel] {
        
        guard let url = Bundle.main.url(forResource: bundleFileName, withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try await client.fetchData(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([TransactionModel].self, from: data)
    }
}

    
