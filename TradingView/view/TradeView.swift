//
//  TradeView.swift
//  TradingView
//
//  Created by Sirac Seyidov on 19.10.2023.
//

import SwiftUI
import WebKit
import Combine

struct TradeView: View {
    let webView = WKWebView()
    let pair: String
    let pairIndex: Int
    @State private var urlString: String = "https://www.tradingview.com/chart/?symbol=FX_IDC%3A"
    @State private var goPair: Bool = false
    @State private var balance: Int = 10000
    @State private var timer: String = "00:01"
    @State private var investment: String = "100"
    @State private var showAlert: Bool = false
    @State var randomBool = Bool.random()
    
    var body: some View {
        VStack{
            Text("Trade")
                .foregroundColor(.white)
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(20)
            
            VStack{
                Text("Balance")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .padding(1)
                Text(String(balance))
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(1)
            }
            .frame(width: 320, height: 55)
            .background(Color(uiColor: UIColor(hexaString: "#333749")))
            .cornerRadius(12)
            
            Spacer()
            
            WebView(url: URL(string: "\(urlString)\(pair)")!)
            
            Spacer()
            
            NavigationLink(destination: PairSelectionView(pairIndex: pairIndex), isActive: $goPair){
            }
            
            VStack{
                Button(action: {
                    goPair = true
                }){
                    HStack{
                        Spacer()
                        Text(
                            "\(String(pair.prefix(3))) / \(String(pair.suffix(3)))"
                        )
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer().frame(width: 20)
                    }
                    .frame(width: 320, height: 50)
                    .background(Color(uiColor: UIColor(hexaString: "#333749")))
                    .cornerRadius(12)
                }
                
                HStack{
                    VStack{
                        Text("Timer")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                        
                        HStack{
                            Spacer().frame(width: 10)
                            Button(action: {
                                timer = "00:0"+String(Int(String(timer.suffix(2)))! - 01)
                            }){
                                Image(systemName: "minus.circle")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            TextField("00:01", text: $timer)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                            Spacer()
                            Button(action: {
                                timer = "00:0"+String(Int(String(timer.suffix(2)))! + 01)
                            }){
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.gray)
                            }
                            Spacer().frame(width: 10)
                        }
                    }
                    .frame(width: 150, height: 50)
                    .background(Color(uiColor: UIColor(hexaString: "#333749")))
                    .cornerRadius(12)
                    
                    Spacer()
                    
                    VStack{
                        Text("Investment")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                        
                        HStack{
                            Spacer().frame(width: 10)
                            Button(action: {
                                investment = String(Int(investment)!-100)
                            }){
                                Image(systemName: "minus.circle")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            TextField("100$", text: $investment)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .onReceive(Just(investment)) { input in
                                    let filteredInput = input.filter { $0.isNumber }
                                    if let number = Int(filteredInput), number > balance {
                                        investment = String(balance)
                                    } else {
                                        investment = filteredInput
                                    }
                                }
                            Spacer()
                            Button(action: {
                                investment = String(Int(investment)!+100)
                            }){
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.gray)
                            }
                            Spacer().frame(width: 10)
                        }
                    }
                    .frame(width: 150, height: 50)
                    .background(Color(uiColor: UIColor(hexaString: "#333749")))
                    .cornerRadius(12)
                }
                .frame(width: 320, height: 50)
                
                HStack{
                    Button(action: {
                        showAlert = true
                        if randomBool{
                            //balance +=  Int(investment)!
                            balance +=  Int(investment)!*7/10
                            randomBool = Bool.random()
                        }else{
                            balance +=  Int(investment)!
                        }
                    }){
                        Text("Sell")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .frame(width: 150, height: 50)
                            .background(Color(uiColor: UIColor(hexaString: "#fe3d43")))
                            .cornerRadius(12)
                    }
                    Spacer()
                    Button(action: {
                        showAlert = true
                        balance -=  Int(investment)!
                    }){
                        Text("Buy")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .frame(width: 150, height: 50)
                            .background(Color(uiColor: UIColor(hexaString: "#35b972")))
                            .cornerRadius(12)
                    }
                }
                .frame(width: 320, height: 50)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(uiColor: UIColor(hexaString: "#1c1f2d")))
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Successfully!"),
                message: Text("Action successfully completed."),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

#Preview {
    TradeView(pair: "GBPUSD", pairIndex: 1)
}
