//
//  TransactionStore.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import Foundation

final class TransactionStore {
    static let shared = TransactionStore()
    private let key = "transactions"
    
    func save(_ transactions: [TransactionModel]) {
        let data = try? JSONEncoder().encode(transactions)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func load() -> [TransactionModel] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let transactions = try? JSONDecoder().decode([TransactionModel].self, from: Data()) else {
            return []
        }
        return transactions
    }
}
