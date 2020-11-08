//
//  indomeEditView.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

struct IncomeEditView: View {
    @State var itemList:[String] = []
    @State var new = ""
    
    
    var body: some View {
        VStack {
            
            EditButton()
            
            VStack(alignment:.leading) {
                
   
                HStack {
                    TextField("新しい項目の追加",
                              text: $new)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        self.itemList.append(self.new)
                        self.new = ""
                    }) {
                        Text("追加")
                            .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }.padding([.leading,.trailing])
            List {
                ForEach(itemList, id: \.self) { user in
                    Text(user)
                }.onDelete { offset in
                    self.itemList.remove(atOffsets: offset)
                }.onMove { souere, destination in
                    self.itemList.move(fromOffsets: souere,
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
