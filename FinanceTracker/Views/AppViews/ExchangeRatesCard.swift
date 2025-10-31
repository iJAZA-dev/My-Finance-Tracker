//
//  ExchangeRatesCard.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import SwiftUI

struct ExchangeRateCardView: View {
    let rate: ExchangeRateModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(rate.currencyCode)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(rate.currencyName)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(rate.flagImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Buy")
                        .foregroundColor(.green)
                        .font(.caption.bold())
                    Text(String(format: "%.2f", rate.buyRate))
                        .font(.headline)
                        .foregroundColor(.black)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text("Sell")
                        .foregroundColor(.red)
                        .font(.caption.bold())
                    Text(String(format: "%.2f", rate.sellRate))
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.4))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    ExchangeRateCardView(rate: ExchangeRateModel(currencyCode: "USD", currencyName: "United States Dollar", buyRate: 144.25, sellRate: 145.25, flagImage: "us"))
        .padding()
        .background(Color(.systemGray6))
}
