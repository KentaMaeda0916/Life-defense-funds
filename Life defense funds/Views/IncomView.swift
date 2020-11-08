//
//  IncomView.swift
//  Life defense funds
//
//  Created by まえけん on 2020/06/20.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI


struct IncomView: View {
    @EnvironmentObject var item: Items
    
    @State var IncomSum = 0
    
    @State var BasicSalary = ""
    @State var Overtime = ""
    @State var OtehrIncomMonthly = ""
    @State var Bonus = ""
    @State var OtherIncomYearly = ""
    
    @State var IncomMonthly = 0
    @State var IncomYearly = 0
    
    
    var isEnabled: Bool {
        BasicSalary.count > 0 &&
        Overtime.count > 0 &&
        OtehrIncomMonthly.count > 0 &&
        Bonus.count > 0 &&
        OtherIncomYearly.count > 0
        
    }
    var disabled: Bool {
        BasicSalary.count != 0 &&
        Overtime.count != 0 &&
        OtehrIncomMonthly.count != 0 &&
        Bonus.count != 0 &&
        OtherIncomYearly.count != 0
    }


    
    var body: some View {
        Form {
            Section() {
                HStack {
                    Button(action: {
                        self.IncomMonthly = Int(Double(self.BasicSalary)! + Double(self.Overtime)! + Double(self.OtehrIncomMonthly)!)
                        self.IncomYearly = Int(Double(self.Bonus)! + Double(self.OtherIncomYearly)!)
                        self.IncomSum = Int(self.IncomMonthly) * 12 + Int(self.IncomYearly)
                        self.item.Incom = Int(self.IncomSum)
                    }) {
                        Text("収入合計")
                        .disabled(!self.isEnabled)
                    }.disabled(!disabled)
                    Spacer()
                    Text("\(item.Incom)")
                }
            }
            Section(header: Text("毎月収入")) {
                HStack {
                    Text("基本給")
                    Spacer()
                    TextField("数値を入力", text: $BasicSalary)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                }
            
                HStack {
                    Text("残業手当")
                    Spacer()
                    TextField("数値を入力", text: $Overtime)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("その他")
                    Spacer()
                    TextField("数値を入力", text: $OtehrIncomMonthly)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
            }
            Section(header: Text("年間収入")) {
                HStack {
                    Text("ボーナス(２回分)")
                    Spacer()
                    TextField("数値を入力", text: $Bonus)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("その他")
                    Spacer()
                    TextField("数値を入力", text: $OtherIncomYearly)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
}

struct IncomView_Previews: PreviewProvider {
    static var previews: some View {
        IncomView()
            .environmentObject(Items())
    }
}
