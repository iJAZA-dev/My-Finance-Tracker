//
//  HomeViewModel.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import Foundation
import SwiftUI

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var transactions: [TransactionModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service: TransactionServiceProtocol
    
    init(service: TransactionServiceProtocol = TransactionService()) {
        self.service = service
    }
    
    func fetchTransactions() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            transactions = try await service.fetchTransactions()
        } catch {
            errorMessage = "Failed to load transactions: \(error.localizedDescription)"
        }
    }
}
