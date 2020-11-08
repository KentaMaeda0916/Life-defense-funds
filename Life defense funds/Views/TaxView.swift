//
//  TaxView.swift
//  Life defense funds
//
//  Created by まえけん on 2020/06/21.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

struct TaxView: View {
    @EnvironmentObject var item: Items
    
    @State var TaxSum = 0
    
    @State var EmploymentInsurance = ""
    @State var HealthInsurance = ""
    @State var WelfarePensionInsurance = ""
    @State var IncomeTax = ""
    @State var ResidentTax = ""
    @State var OtherTaxMonthly = ""
    @State var OtherTaxYearly = ""
    
    @State var TaxMonthly2 = 0
    @State var TaxYearly = 0
    @State var TaxMonthly = 0
    
    var isEnabled: Bool {
        EmploymentInsurance.count > 0 &&
        HealthInsurance.count > 0 &&
        WelfarePensionInsurance.count > 0 &&
        IncomeTax.count > 0 &&
        ResidentTax.count > 0 &&
        OtherTaxMonthly.count > 0 &&
        OtherTaxYearly.count > 0
        
    }
    var disabled: Bool {
        EmploymentInsurance.count != 0 &&
        HealthInsurance.count != 0 &&
        WelfarePensionInsurance.count != 0 &&
        IncomeTax.count != 0 &&
        ResidentTax.count != 0 &&
        OtherTaxMonthly.count != 0 &&
        OtherTaxYearly.count != 0
    }

    func Taxsum() {
        self.item.TaxMonthly1 = Int(Double(self.EmploymentInsurance)! + Double(self.HealthInsurance)! + Double(self.ResidentTax)!)
        self.TaxMonthly2 = Int(Double(self.IncomeTax)! + Double(self.WelfarePensionInsurance)! + Double(self.OtherTaxMonthly)!)
        self.TaxYearly = Int(Double(self.OtherTaxYearly)!)
        self.TaxMonthly = Int(self.item.TaxMonthly1) * 12 + Int(self.TaxMonthly2) * 12
        self.item.Tax = Int(self.TaxMonthly) + Int(self.TaxYearly)
    }
    
    var body: some View {
        Form {
            Section() {
                HStack {
                    Button(action: {
                        self.Taxsum()
                    }) {
                        Text("税金合計")
                        .disabled(!self.isEnabled)
                    }.disabled(!disabled)
                    Spacer()
                    Text("\(item.Tax)")
                }
            }
            Section(header: Text("毎月税金")) {
                HStack {
                    Text("雇用保険料")
                    Spacer()
                    TextField("数値を入力", text: $EmploymentInsurance)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.trailing)
                }
            
                HStack {
                    Text("健康保険料")
                    Spacer()
                    TextField("数値を入力", text: $HealthInsurance)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("厚生年金保険料")
                    Spacer()
                    TextField("数値を入力", text: $WelfarePensionInsurance)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("所得税")
                    Spacer()
                    TextField("数値を入力", text: $IncomeTax)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("住民税")
                    Spacer()
                    TextField("数値を入力", text: $ResidentTax)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("その他")
                    Spacer()
                    TextField("数値を入力", text: $OtherTaxMonthly)
                        .keyboardType(.numberPad)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
            }
            Section(header: Text("年間税金")) {
                HStack {
                    Text("その他")
                    Spacer()
                    TextField("数値を入力", text: $OtherTaxYearly)
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

struct TaxView_Previews: PreviewProvider {
    static var previews: some View {
        TaxView()
            .environmentObject(Items())
    }
}
