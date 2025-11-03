//
//  NewHomeView.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import SwiftUI

struct NewHomeView: View {
    @State private var userName: String = "Tony"
    @State private var recentTransLabel: String = "Recent Five Transactions"
    @State private var showAddTransaction: Bool = false
    
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                HeaderView(userName: userName)
                    .padding(.leading)
                BalanceView(transactions: viewModel.transactions)

                if viewModel.isLoading {
                    ProgressView("Loading transactions...")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                } else {
                    TransactionsSection(
                        title: recentTransLabel,
                        transactions: viewModel.transactions
                    )
                    
                }

                AddTransactionButton {
                    showAddTransaction.toggle()
                }
            }
            .padding()
            //.navigationTitle("Finance Tracker")
            .task {
                await viewModel.fetchTransactions()
            }
            .sheet(isPresented: $showAddTransaction) {
                AddTransactionView { newTransaction in
                    viewModel.transactions.append(newTransaction)
                }
            }
        }
    }
}


#Preview {
    NewHomeView()
}
