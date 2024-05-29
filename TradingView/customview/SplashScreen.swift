//
//  SplashScreen.swift
//  TradingView
//
//  Created by Sirac Seyidov on 21.10.2023.
//

import SwiftUI

struct SplashScreen: View {
    @State var percent: CGFloat = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var go: Bool = false
    
    var body: some View {
        VStack{
            CustomProgressView(width: 300, height: 30, percent: percent)
                .animation(.spring(), value: percent)
                .onReceive(timer){ _ in
                    if percent < 100 {
                        percent += 2
                    }else{
                        go = true
                    }
                }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(uiColor: UIColor(hexaString: "#1c1f2d")))
    }
}

#Preview {
    SplashScreen()
}
