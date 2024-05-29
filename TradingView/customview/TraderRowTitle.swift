//
//  TraderRowTitle.swift
//  TradingView
//
//  Created by Sirac Seyidov on 20.10.2023.
//

import SwiftUI

struct TraderRowTitle: View {
    var space: CGFloat = UIScreen.main.bounds.width/11
    
    var body: some View {
        HStack{
            Spacer().frame(width: space)
            Text("N")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer().frame(width: space)
            Text("Country")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer().frame(width: space)
            Text("Name")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("Deposit")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer().frame(width: space)
            Text("Profit")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer().frame(width: space)
        }
        .frame(height: 50)
        .background(Color(uiColor: UIColor(hexaString: "#2e303e")))
    }
}

#Preview {
    TraderRowTitle()
}
