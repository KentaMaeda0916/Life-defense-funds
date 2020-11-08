//
//  TargetRow.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

enum PeriodArry:Int,CaseIterable {
    case Three = 3
    case six = 6
    case twelve = 12
}


struct TargetRow: View {
    @EnvironmentObject var item: Items

    @State var periodraw:PeriodArry = .Three
    @State var now = ""
    
    var isEnabled: Bool {
        now.count > 0
    }
    var disabled: Bool {
        now.count != 0
    }
    
    var body: some View {
        VStack {
            HStack{
                Text("現在貯金額")
                Spacer()
                TextField("数値を入力", text: $now)
                    .keyboardType(.numberPad)
                    .frame(width: 200.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.trailing)
                Text("円")
            }
            .padding(.bottom, 65.0)
            
            
            Button(action: {
                self.item.Target = Int(Double((self.item.minimum)) * Double((self.periodraw.rawValue)))
                self.item.ToTheGoal = Int(Double((self.item.Target)) - Double(self.now)!)
            }){
                Text("目標金額計算")
                    .disabled(!self.isEnabled)
            }.disabled(!disabled)
            
            Picker(selection: $periodraw,
                   label: Text("periodraw")) {
                    ForEach(PeriodArry.allCases, id: \.self) { (mode) in
                        Text("\(mode.rawValue)ヶ月").tag(mode)
                    }
            }.pickerStyle(SegmentedPickerStyle())
            HStack{
                Text("目標貯金額")
                
                Spacer()
                Text("\(item.Target)")
                Text("円")
            }
            
            
            HStack{
                Text("目標まで")
                Spacer()
                Text("\(item.ToTheGoal)")
                Text("円")
            }
            
        }
    }
}

struct TargetRow_Previews: PreviewProvider {
    static var previews: some View {
        TargetRow()
            .environmentObject(Items())
    }
}
