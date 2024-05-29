//
//  TradingViewApp.swift
//  TradingView
//
//  Created by Sirac Seyidov on 19.10.2023.
//

import SwiftUI

@main
struct TradingViewApp: App {
    @State private var selectedTab: Int = 2
    var body: some Scene {
        WindowGroup {
            HomeView(pair: "GBPUSD", pairIndex: 1, selectedTab: $selectedTab, showSplash: true)
        }
    }
}
