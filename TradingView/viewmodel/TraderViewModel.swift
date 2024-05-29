//
//  TraderRow.swift
//  TradingView
//
//  Created by Sirac Seyidov on 19.10.2023.
//

import SwiftUI

struct TraderRow: View {
    let model: TraderModel
    var space: CGFloat = UIScreen.main.bounds.width/11
    
    var body: some View {
        HStack{
            Spacer().frame(width: space)
            Text(String(model.number))
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(.gray)
            Spacer().frame(width: space)
            Image(model.country)
            Spacer().frame(width: space)
            Text(model.name)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("$\(String(model.deposit))")
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer().frame(width: space)
            Text("$\(String(model.profit))")
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(.green)
            Spacer().frame(width: space)
        }
        .frame(height: 50)
        .background(model.number % 2 == 0 ? Color(uiColor: UIColor(hexaString: "#2e303e")) : Color(uiColor: UIColor(hexaString: "#1c1f2d")))
    }
}

#Preview {
    TraderRow(model: TraderModel(country: "united_states", name: "Steve", deposit: 9745, profit: 18795))
}
