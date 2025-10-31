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
    func fetchTransactions() async throws -> [TransactionModel] {
        guard let url = Bundle.main.url(forResource: "transaction", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([TransactionModel].self, from: data)
    }
}

    
