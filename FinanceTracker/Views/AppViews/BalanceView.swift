//
//  BalanceView.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import SwiftUI

struct BalanceView: View {
    let transactions: [TransactionModel]
    @State var moneyInLable: String = "Money In"
    @State var moneyOutLable: String = "Money Out"
    @State var currency: String = "KES"
    private var amountIn: Double {
        transactions
            .filter { $0.amount > 0 }
            .map { $0.amount }
            .reduce(0, +)
    }
    private var amountOut: Double {
        transactions
            .filter { $0.amount < 0 }
            .map { abs($0.amount) }
            .reduce(0, +)
    }
    private var balance: Double {
        amountIn - amountOut
    }

    var body: some View {
        VStack(spacing: 12) {
            Text("Current Balance")
                .font(.headline)
            
            HStack(spacing: 4) {
                Text(String(format: "%.2f", balance))
                    .font(.title2)
                    .fontWeight(.bold)
                Text(currency)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 4)
            
            HStack {
                VStack {
                    Text(moneyInLable)
                        .font(.subheadline)
                        .foregroundColor(.green)
                    Text("\(currency) \(String(format: "%.2f", amountIn))")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .padding(.leading)
                
                Spacer()
                
                VStack {
                    Text(moneyOutLable)
                        .font(.subheadline)
                        .foregroundColor(.red)
                    Text("\(currency) \(String(format: "%.2f", amountOut))")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                .padding(.trailing)
            }
        }
        .frame(width: 350, height: 150)
        .background(Color.green.opacity(0.15))
        .cornerRadius(10)
        .padding()
    }
}

//#Preview {
//    BalanceView()
//}
