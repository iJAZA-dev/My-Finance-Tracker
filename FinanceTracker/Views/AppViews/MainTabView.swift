//
//  MainTabView.swift
//  FinanceTracker
//
//  Created by Emmanuel Korir on 31/10/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NewHomeView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            ExchangeRatesView()
                .tabItem {
                    Label("Exchange Rate", systemImage: "arrow.up.circle.fill")
                }
            MoreView()
                .tabItem {
                    Label("More", systemImage: "ellipsis.circle")
                }
        }
    }
}

#Preview {
    MainTabView()
}
