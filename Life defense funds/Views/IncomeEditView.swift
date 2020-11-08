//
//  indomeEditView.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI
enum IncomArry:String,CaseIterable {
    case Salary = "給与収入"
    case Bonus = "ボーナス"
    case Other = "その他"
}

struct IncomeEditView: View {
    @State var Incomraw:IncomArry = .Salary
    
    @State var IncomList:[String] = []
    @State var new = ""
    
    var body: some View {
        VStack {
            EditButton()
            Picker(selection: $Incomraw,
                   label: Text("Incomraw")) {
                    ForEach(IncomArry.allCases, id: \.self) { (mode) in
                        Text("\(mode.rawValue)").tag(mode)
                    }
            }.pickerStyle(SegmentedPickerStyle())

            VStack(alignment:.leading) {
                HStack {
                    TextField("新しい項目の追加",
                              text: $new)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        self.IncomList.append(self.new)
                        self.new = ""
                    }) {
                        Text("追加")
                            .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }.padding([.leading,.trailing])
            List {
                ForEach(IncomList, id: \.self) { user in
                    Text(user)
                }.onDelete { offset in
                    self.IncomList.remove(atOffsets: offset)
                }.onMove { souere, destination in
                    self.IncomList.move(fromOffsets: souere,
                                        toOffset: destination)
                }
            }
        }
    }
}

struct IndomeEditView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeEditView()
    }
}
