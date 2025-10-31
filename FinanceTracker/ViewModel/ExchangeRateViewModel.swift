//
//  ExchangeRateViewModel.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import Foundation

@MainActor
final class ExchangeRatesViewModel: ObservableObject {
    @Published var exchangeRates: [ExchangeRateModel] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private let service: ExchangeRateServiceProtocol
    
    init(exchangeRates: ExchangeRateServiceProtocol = ExchangeRateService()) {
        self.service = exchangeRates
    }
    
    func fetchExchangeRates() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            exchangeRates = try await service.fetchExchangeRates()
        } catch {
            errorMessage = "Failed to load exchange rates: \(error.localizedDescription)"
        }
    }
}

