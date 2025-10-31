//
//  BalanceView.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import SwiftUI

struct BalanceView: View {
    @State var balance: Double = 0
    @State var moneyInLable: String = "Money In"
    @State var moneyOutLable: String = "Money Out"
    @State var amountIn: Double = 0
    @State var amountOut: Double = 0
    @State var currency: String = "KES"


    var body: some View {
        VStack {
            Text("Current Balance")
            HStack {
                Text("\(balance)")
                Text("\(currency)")
            }
            .padding(.bottom)
            HStack {
                VStack {
                    Text(moneyInLable)
                    Text("\(amountIn)")
                }
                .padding(.leading)
                Spacer()
                VStack {
                    Text(moneyOutLable)
                    Text("\(amountOut)")
                }
                .padding(.trailing)
            }
        }
        .frame(width: 350, height: 150)
        .background(Color.green.opacity(0.25))
        .cornerRadius(10)
        .padding()
    
    }
}

#Preview {
    BalanceView()
}
