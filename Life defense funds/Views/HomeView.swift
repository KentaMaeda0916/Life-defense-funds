//
//  HomeView.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var item: Items
    
    var body: some View {
        
        VStack() {
            Text("生活防衛資金計算")
                .font(.largeTitle)
                .padding(10.0)

            BalanceOfPaymentsRow()
                .padding(10.0)
            TargetRow()
                .padding(.top, 31.0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Items())
    }
}
