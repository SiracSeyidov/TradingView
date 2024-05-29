//
//  CustomProgressView.swift
//  TradingView
//
//  Created by Sirac Seyidov on 19.10.2023.
//

import Foundation
import SwiftUI

struct CustomProgressView: View {
    var width: CGFloat = 300
    var height: CGFloat = 30
    var percent: CGFloat = 40
    
    var body: some View{
        let multiplier = width/100
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color(uiColor: UIColor(hexaString: "#5B5A60")))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent*multiplier, height: height)
                .foregroundColor(Color(uiColor: UIColor(hexaString: "#35b972")))
            
            Text("\(Int(percent))%")
                .foregroundStyle(.white)
                .frame(width: width, height: height)
        }
    }
}

#Preview {
    CustomProgressView(width: 300, height: 25, percent: 40)
}
