//
//  AddTransactionViewModel.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import Foundation

@MainActor
final class AddTransactionViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var amount: String = ""
    @Published var currency: String = "KES"
    @Published var date: Date = Date()
    
    func saveTransaction() {
        print("Saved: \(title) - \(amount) \(currency) on \(date)")
    }
}
