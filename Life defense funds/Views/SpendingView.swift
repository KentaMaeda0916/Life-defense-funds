//
//  SpendingView.swift
//  Life defense funds
//
//  Created by まえけん on 2020/06/21.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

struct SpendingView: View {
        @EnvironmentObject var item: Items
        
        @State var SpendingSum = 0
        
        @State var House = ""
        @State var Electricity = ""
        @State var Gas = ""
        @State var Water = ""
        @State var Car = ""
        @State var Communication = ""
        @State var Food = ""
        @State var DailyNecessities = ""
        @State var Insurance = ""
        @State var OtherSpending = ""
        @State var Amusement = ""
        
        var isEnabled: Bool {
            House.count > 0 &&
            Electricity.count > 0 &&
            Gas.count > 0 &&
            Water.count > 0 &&
            Car.count > 0 &&
            Communication.count > 0 &&
            Food.count > 0 &&
            DailyNecessities.count > 0 &&
            Insurance.count > 0 &&
            OtherSpending.count > 0 &&
            Amusement.count > 0

            
        }
        var disabled: Bool {
            House.count != 0 &&
            Electricity.count != 0 &&
            Gas.count != 0 &&
            Water.count != 0 &&
            Car.count != 0 &&
            Communication.count != 0 &&
            Food.count != 0 &&
            DailyNecessities.count != 0 &&
            Insurance.count != 0 &&
            OtherSpending.count != 0 &&
            Amusement.count != 0
        }
    func spendindsum() {
        self.item.Spending1 = Int(Double(self.House)! + Double(self.Electricity)! + Double(self.Gas)! + Double(self.Water)!)
        self.item.Spending2 = Int(Double(self.Car)! + Double(self.Communication)! + Double(self.Food)! + Double(self.DailyNecessities)!)
        self.item.Spending3 = Int(Double(self.Insurance)! + Double(self.OtherSpending)!)
        self.item.SpendingOne = Int(self.item.Spending1) + Int(self.item.Spending2) + Int(self.item.Spending3)
        self.item.SpendingMonthly = Int(self.item.Spending1) * 12 + Int(self.item.Spending2) * 12 + Int(self.item.Spending3) * 12
        self.SpendingSum = Int(self.item.SpendingMonthly) + Int(Double(self.Amusement)!)
        self.item.Spending = Int(self.SpendingSum)
        
    }
        var body: some View {
            Form {
                Section() {
                    HStack {
                        Button(action: {
                            self.spendindsum()

                        }) {
                            Text("支出合計")
                            .disabled(!self.isEnabled)
                        }.disabled(!disabled)
                        Spacer()
                        Text("\(item.Spending)")
                    }
                }
                Section(header: Text("毎月支出")) {
                    HStack {
                        Text("家賃")
                        Spacer()
                        TextField("数値を入力", text: $House)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.trailing)
                    }
                
                    HStack {
                        Text("電気")
                        Spacer()
                        TextField("数値を入力", text: $Electricity)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("ガス")
                        Spacer()
                        TextField("数値を入力", text: $Gas)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("水道")
                        Spacer()
                        TextField("数値を入力", text: $Water)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("車")
                        Spacer()
                        TextField("数値を入力", text: $Car)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("通信費")
                        Spacer()
                        TextField("数値を入力", text: $Communication)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("食費")
                        Spacer()
                        TextField("数値を入力", text: $Food)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("日用品")
                        Spacer()
                        TextField("数値を入力", text: $DailyNecessities)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("保険")
                        Spacer()
                        TextField("数値を入力", text: $Insurance)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("その他")
                        Spacer()
                        TextField("数値を入力", text: $OtherSpending)
                            .keyboardType(.numberPad)
                            .frame(width: 200.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    
                }
                Section(header: Text("年間支出")) {
                    HStack {
                        Text("ゆとり費")
                        Spacer()
                        TextField("数値を入力", text: $Amusement)
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

    struct SpendingView_Previews: PreviewProvider {
        static var previews: some View {
            SpendingView()
                .environmentObject(Items())
        }
    }
