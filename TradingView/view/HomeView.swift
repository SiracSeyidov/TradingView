//
//  HomeView.swift
//  TradingView
//
//  Created by Sirac Seyidov on 19.10.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var notificationPermission = false
    let pair: String
    let pairIndex: Int
    
    @State var percent: CGFloat = 0
    let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    @State private var go: Bool = false
    @Binding var selectedTab : Int
    let showSplash: Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                TabView(selection: $selectedTab){
                    TradeView(pair: pair, pairIndex: pairIndex)
                        .tabItem {
                            Image(systemName: "chart.xyaxis.line")
                            Text("Trade")
                        }
                        .tag(1)
                    
                    TopView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Top")
                        }
                        .tag(2)
                }
                .navigationBarBackButtonHidden(true)
                
                if showSplash{
                    if percent != 100{
                        content
                    }
                }
            }
            .onChange(of: percent){
                if percent == 100{
                    requestNotificationPermission()
                }
            }
        }
    }
    
    var content: some View{
        VStack{
            CustomProgressView(width: 300, height: 30, percent: percent)
                .animation(.spring(), value: percent)
                .onReceive(timer){ _ in
                    if percent < 100 {
                        if percent < 60{
                            percent += 15
                        }else{
                            if percent < 80{
                                percent += 20
                            }else{
                                if percent < 95{
                                    percent += 15
                                }else{
                                    if percent < 99{
                                        percent += 4
                                    }else{
                                        percent += 1
                                    }
                                }
                            }
                        }
                    }else{
                        go = true
                    }
                }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(uiColor: UIColor(hexaString: "#1c1f2d")))
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                notificationPermission = true
            } else {
                notificationPermission = false
            }
        }
    }
}

#Preview {
    EmptyView()
    //HomeView(pair: "GBPUSD", pairIndex: 1, showSplash: true)
}
