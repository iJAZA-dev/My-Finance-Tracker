//
//  TransactionModel.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import Foundation

protocol TransactionRepresentable {
    var id: Int { get }
    var amount: Double { get }
    var currency: String { get }
    var date: Date { get }
    var description: String { get }
}

extension TransactionRepresentable {
    var formattedAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct TransactionModel: Identifiable, Codable, TransactionRepresentable {
    let id: Int
    let amount: Double
    let currency: String
    let date: Date
    let description: String
}



