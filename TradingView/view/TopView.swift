//
//  TopView.swift
//  TradingView
//
//  Created by Sirac Seyidov on 19.10.2023.
//

import SwiftUI

struct TopView: View {
    @State var list = [
        TraderModel(country: "united_states", name: "Steve", deposit: 800, profit: 1800),
        TraderModel(country: "united_kingdom", name: "Oliver", deposit: 600, profit: 1600),
        TraderModel(country: "azerbaijan", name: "Jack", deposit: 100, profit: 1100),
        TraderModel(country: "turkey", name: "Harry", deposit: 400, profit: 1400),
        TraderModel(country: "russia", name: "Jacob", deposit: 700, profit: 1700),
        TraderModel(country: "brazil", name: "Thomas", deposit: 300, profit: 1300),
        TraderModel(country: "canada", name: "George", deposit: 500, profit: 1500),
        TraderModel(country: "india", name: "James", deposit: 100, profit: 1000),
        TraderModel(country: "france", name: "William", deposit: 200, profit: 1200),
        TraderModel(country: "germany", name: "Charley", deposit: 900, profit: 1900)
    ]
    @State var list2 : [TraderModel] = []
    
    let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    @State var randomInt = Int.random(in: 0..<10)
    @State var randomInt2 = Int.random(in: 0..<10)
    @State var randomProfit = Int.random(in: 50..<151)
    @State var randomDeposit = Int.random(in: 50..<151)
    
    var body: some View {
        VStack{
            Text("Top 10 Traders")
                .foregroundColor(.white)
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Spacer()
            
            HStack{
                Spacer().frame(width: 10)
                VStack{
                    TraderRowTitle()
                    ForEach(list2, id: \.self){m in
                        TraderRow(model: m)
                    }
                }
                .cornerRadius(16)
                .onReceive(timer){ _ in
                    randomInt = Int.random(in: 0..<9)
                    randomInt2 = Int.random(in: 0..<9)
                    randomProfit = Int.random(in: 50..<150)
                    randomDeposit = Int.random(in: 50..<150)
                    
                    list2[randomInt].profit += randomProfit
                    list2[randomInt2].deposit += randomDeposit
                    
                    list2 = list2.sorted(by: {
                        $0.profit > $1.profit
                    })
                    
                    for i in 0..<list.count {
                        list2[i].number = i + 1
                    }
                }
                Spacer().frame(width: 10)
            }
            
            Spacer()
        }
        .onAppear{
            list2.removeAll()
            
            list2 = list.sorted()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(uiColor: UIColor(hexaString: "#1c1f2d")))
    }
}

#Preview {
    TopView()
}
