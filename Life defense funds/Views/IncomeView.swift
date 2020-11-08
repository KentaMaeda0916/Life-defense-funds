//
//  incomeView.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

struct IncomeView: View {
    var body: some View {
        List{
            ForEach(itemStore.items) { item in
                IncomRow(item: item)
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct incomeView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeView()
    }
}
