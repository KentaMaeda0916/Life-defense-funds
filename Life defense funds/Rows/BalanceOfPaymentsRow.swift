//
//  Balance of paymentsRow.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

struct BalanceOfPaymentsRow: View {
    @EnvironmentObject var item: Items
    
    var isEnabled: Bool {
        item.Incom > 0 &&
        item.Tax > 0 &&
        item.Spending > 0
    }
    var disabled: Bool {
        item.Incom != 0 &&
        item.Tax != 0 &&
        item.Spending != 0
    }

    var body: some View {
        VStack{
            HStack{
                Text("収入")
                Spacer()
                Text("\(item.Incom)")
                Text("円")
            }
            HStack{
                Text("税金")
                Spacer()
                Text("\(item.Tax)")
                Text("円")
            }
            HStack{
                Text("支出")
                Spacer()
                Text("\(item.Spending)")
                Text("円")
            }
            HStack{
                Text("収支")
                Spacer()
                Text("\(item.AnnualBalance)")
                Text("円")
            }
            Button(action: {
                self.item.AnnualBalance = Int((self.item.Incom) - ((self.item.Tax) + (self.item.Spending)))
                self.item.minimum = Int((self.item.TaxMonthly1) + (self.item.SpendingOne))

            }){
                Text("年間収支計算").disabled(!self.isEnabled)
            }.disabled(!disabled)
            
        }
    }
}

struct Balance_of_paymentsRow_Previews: PreviewProvider {
    static var previews: some View {
        BalanceOfPaymentsRow()
            .environmentObject(Items())
    }
}
