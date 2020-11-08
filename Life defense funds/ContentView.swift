//
//  ContentView.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var item: Items
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("ホーム")
            }
            IncomView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("収入")
            }
            TaxView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("税金")
            }
            SpendingView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("支出")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Items())
    }
}
