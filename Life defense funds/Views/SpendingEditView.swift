//
//  SpendingEditView.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

struct SpendingEditView: View {
    @State var SpendingList:[String] = []
    @State var new = ""
    @State var SpendingItem = 0
    
    
    var body: some View {
       VStack {
            EditButton()
            
        
        
            VStack(alignment:.leading) {
                    
            HStack {
                TextField("新しい項目の追加",
                          text: $new)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    self.SpendingList.append(self.new)
                    self.new = ""
                }) {
                    Text("追加")
                        .buttonStyle(BorderlessButtonStyle())
                }
            }
        }.padding([.leading,.trailing])
        List {
            ForEach(SpendingList, id: \.self) { user in
                Text(user)
            }.onDelete { offset in
                self.SpendingList.remove(atOffsets: offset)
            }.onMove { souere, destination in
                self.SpendingList.move(fromOffsets: souere,
                                       toOffset: destination)
            }
        }
        }
    }
}

struct SpendingEditView_Previews: PreviewProvider {
    static var previews: some View {
        SpendingEditView()
    }
}
