//
//  AddTransactionsView.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isIncome = false
    @State private var isExpense = true
    @State private var amount: String = ""
    @State private var date = Date()
    @State private var selectedCategory = "Transport"
    @State private var description: String = ""
    
    let categories = ["Transport", "Shopping", "Food", "Bills", "Entertainment"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: - Category Toggle
                    Text("Category")
                        .font(.headline)
                    
                    HStack(spacing: 40) {
                        CategoryToggleButton(
                            title: "Income",
                            isSelected: isIncome,
                            action: {
                                isIncome = true
                                isExpense = false
                            }
                        )
                        
                        CategoryToggleButton(
                            title: "Expense",
                            isSelected: isExpense,
                            action: {
                                isExpense = true
                                isIncome = false
                            }
                        )
                    }
                    
                    // MARK: - Amount Field
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Amount (KES)")
                            .font(.headline)
                        
                        TextField("1,000.00", text: $amount)
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    
                    // MARK: - Date Picker
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Date")
                            .font(.headline)
                        
                        HStack {
                            DatePicker("", selection: $date, displayedComponents: .date)
                                .labelsHidden()
                                .accentColor(.green)
                            Spacer()
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                    
                    // MARK: - Category Picker
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Category")
                            .font(.headline)
                        
                        HStack {
                            Image(systemName: "car.fill")
                                .foregroundColor(.red)
                            Spacer()
                            Picker("Category", selection: $selectedCategory) {
                                ForEach(categories, id: \.self) { category in
                                    Text(category).tag(category)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .accentColor(.black)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                    
                    // MARK: - Description Field
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Description")
                            .font(.headline)
                        
                        TextField("Fuel for wife's car", text: $description)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                    
                    // MARK: - Submit Button
                    Button(action: {
                        // Handle save logic
                        dismiss()
                    }) {
                        Text("Add Transaction")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
            .navigationTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



#Preview {
    AddTransactionView()
}

