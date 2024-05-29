//
//  PairSelectionView.swift
//  TradingView
//
//  Created by Sirac Seyidov on 21.10.2023.
//

import SwiftUI

struct PairSelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var buttonStates = [
        false, false, false, false,
        false, false, false, false,
        false, false, false, false,
        false, false, false, false
    ]
    @State private var goBack: Bool = false
    @State private var pair: String = "GBPUSD"
    @State var pairIndex: Int
    @State private var selectedTab: Int = 1
    
    var body: some View {
        VStack{
            HStack{
                Spacer().frame(width: 20)
                Button(action: {
                    goBack = true
                }){
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                Spacer()
                Text("Currency pair")
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .padding(.trailing, 35)
                Spacer()
            }
            .padding(20)
            Spacer().frame(height: 50)
            
            NavigationLink(destination: HomeView(pair: pair, pairIndex: pairIndex, selectedTab: $selectedTab, showSplash: false), isActive: $goBack){
            }
            
            VStack(spacing: 20){
                HStack{
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(0)
                        goBack = false
                        pair = "EURUSD"
                        pairIndex = 0
                    }){
                        PairViewModel(txt: "EUR / USD", bg: self.buttonStates[0])
                    }
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(1)
                        goBack = false
                        pair = "GBPUSD"
                        pairIndex = 1
                    }){
                        PairViewModel(txt: "GBP / USD", bg: self.buttonStates[1])
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(2)
                        goBack = false
                        pair = "JPYUSD"
                        pairIndex = 2
                    }){
                        PairViewModel(txt: "JPY / USD", bg: self.buttonStates[2])
                    }
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(3)
                        goBack = false
                        pair = "CHFUSD"
                        pairIndex = 3
                    }){
                        PairViewModel(txt: "CHF / USD", bg: self.buttonStates[3])
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(4)
                        goBack = false
                        pair = "AUDUSD"
                        pairIndex = 4
                    }){
                        PairViewModel(txt: "AUD / USD", bg: self.buttonStates[4])
                    }
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(5)
                        goBack = false
                        pair = "NZDUSD"
                        pairIndex = 5
                    }){
                        PairViewModel(txt: "NZD / USD", bg: self.buttonStates[5])
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(6)
                        goBack = false
                        pair = "CADUSD"
                        pairIndex = 6
                    }){
                        PairViewModel(txt: "CAD / USD", bg: self.buttonStates[6])
                    }
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(7)
                        goBack = false
                        pair = "MXNUSD"
                        pairIndex = 7
                    }){
                        PairViewModel(txt: "MXN / USD", bg: self.buttonStates[7])
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(8)
                        goBack = false
                        pair = "BRLUSD"
                        pairIndex = 8
                    }){
                        PairViewModel(txt: "BRL / USD", bg: self.buttonStates[8])
                    }
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(9)
                        goBack = false
                        pair = "INRUSD"
                        pairIndex = 9
                    }){
                        PairViewModel(txt: "INR / USD", bg: self.buttonStates[9])
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(10)
                        goBack = false
                        pair = "CNYUSD"
                        pairIndex = 10
                    }){
                        PairViewModel(txt: "CNY / USD", bg: self.buttonStates[10])
                    }
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(11)
                        goBack = false
                        pair = "SGDUSD"
                        pairIndex = 11
                    }){
                        PairViewModel(txt: "SGD / USD", bg: self.buttonStates[11])
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(12)
                        goBack = false
                        pair = "AEDEUR"
                        pairIndex = 12
                    }){
                        PairViewModel(txt: "AED / EUR", bg: self.buttonStates[12])
                    }
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(13)
                        goBack = false
                        pair = "USDCAD"
                        pairIndex = 13
                    }){
                        PairViewModel(txt: "USD / CAD", bg: self.buttonStates[13])
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(14)
                        goBack = false
                        pair = "USDJPY"
                        pairIndex = 14
                    }){
                        PairViewModel(txt: "USD / JPY", bg: self.buttonStates[14])
                    }
                    Spacer()
                    Button(action: {
                        self.updateButtonStates(15)
                        goBack = false
                        pair = "USDCHF"
                        pairIndex = 15
                    }){
                        PairViewModel(txt: "USD / CHF", bg: self.buttonStates[15])
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .onAppear{
            buttonStates[pairIndex] = true
        }
        .navigationBarBackButtonHidden(true)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(uiColor: UIColor(hexaString: "#1c1f2d")))
    }
    
    func updateButtonStates(_ selectedButtonIndex: Int) {
        for i in 0..<buttonStates.count {
            buttonStates[i] = (i == selectedButtonIndex)
        }
    }
}

#Preview {
    PairSelectionView(pairIndex: 1)
}
