//
//  ExchangeRateModel.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import Foundation

import Foundation

struct ExchangeRateModel: Identifiable, Codable {
    var id = UUID()
    let currencyCode: String
    let currencyName: String
    let buyRate: Double
    let sellRate: Double
    let flagImage: String
}


enum NetworkError: Error {
    case noData
    case decodingFailed
    case invalidURL
    case urlSessionFailed
}
