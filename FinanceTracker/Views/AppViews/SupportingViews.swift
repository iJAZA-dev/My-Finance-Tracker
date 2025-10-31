//
//  SupportingHomeViews.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import SwiftUI
import Foundation

struct HeaderView: View {
    let userName: String

    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
            Text("Good Morning \(userName)")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.leading, 4)
            Spacer()
        }
    }
}

struct TransactionsSection: View {
    let title: String
    let transactions: [TransactionModel]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.caption)
                Spacer()
                Button("View All") {
                    // NAVIGATION HANDLER
                }
                .foregroundColor(.green)
            }

            ForEach(transactions.prefix(5)) { txn in
                TransactionRow(transaction: txn)
            }
        }
    }
}

struct TransactionRow: View {
    let transaction: TransactionModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.description)
                    .font(.subheadline)
                Text(transaction.formattedDate)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(transaction.formattedAmount)
                .foregroundColor(transaction.amount < 0 ? .red : .green)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

struct AddTransactionButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Add Transaction")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
        .padding(.top, 8)
    }
}

struct CategoryToggleButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Circle()
                    .stroke(isSelected ? Color.green : Color.gray, lineWidth: 2)
                    .overlay(
                        Circle()
                            .fill(isSelected ? Color.green : Color.clear)
                            .frame(width: 10, height: 10)
                    )
                    .frame(width: 24, height: 24)
                
                Text(title)
                    .foregroundColor(.black)
                    .fontWeight(isSelected ? .semibold : .regular)
            }
        }
    }
}



