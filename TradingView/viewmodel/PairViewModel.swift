//
//  PairViewModel.swift
//  TradingView
//
//  Created by Sirac Seyidov on 21.10.2023.
//

import SwiftUI

struct PairViewModel: View {
    let txt : String
    let bg : Bool
    
    var body: some View {
        Text(txt)
            .foregroundColor(.white)
            .font(.system(size: 14))
            .fontWeight(.semibold)
            .frame(width: 150, height: 55)
            .background(bg ? Color(uiColor: UIColor(hexaString: "#35b972")) : Color(uiColor: UIColor(hexaString: "#333749")))
            .cornerRadius(12)
    }
}

#Preview {
    EmptyView()
}
