//
//  APIClient.swift
//  MyFinanceTracker
//
//  Created by Faith Ijaza on 02/11/2025.
//

import Foundation

protocol APIClientProtocol {
    func fetchData(from url: URL) async throws -> Data
}

final class APIClient: APIClientProtocol {
    static let shared = APIClient()
    private init() {}

    func fetchData(from url: URL) async throws -> Data {

        if url.isFileURL {
            return try Data(contentsOf: url)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}
