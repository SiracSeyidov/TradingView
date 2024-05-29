//
//  TraderModel.swift
//  TradingView
//
//  Created by Sirac Seyidov on 19.10.2023.
//

import Foundation

struct TraderModel: Identifiable, Comparable, Hashable{
    var id = UUID()
    var country: String
    var name: String
    var deposit: Int
    var profit: Int
    var number: Int
    
    static func < (lhs: TraderModel, rhs: TraderModel) -> Bool {
        return lhs.profit > rhs.profit
    }
    
    init(id: UUID = UUID(), country: String, name: String, deposit: Int, profit: Int) {
        self.id = id
        self.country = country
        self.name = name
        self.deposit = deposit
        self.profit = profit
        self.number = 0
    }
}
