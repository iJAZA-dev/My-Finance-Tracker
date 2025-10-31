//
//  ExchangeRateView.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import SwiftUI

struct ExchangeRatesView: View {
    @StateObject private var viewModel = ExchangeRatesViewModel()
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.exchangeRates) { rate in
                            ExchangeRateCardView(rate: rate)
                        }
                    }
                    .padding()
                }
                .background(Color(.systemGray6))
                
                if viewModel.isLoading {
                    ProgressView("Fetching Rates...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.2)
                }
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationTitle("Exchange Rates")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await viewModel.fetchExchangeRates()
        }
    }
}

#Preview {
    ExchangeRatesView()
}
