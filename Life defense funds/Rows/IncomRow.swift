//
//  ItemRow.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//

import SwiftUI

struct IncomRow: View {
    var item: ItemEntity

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.incometitle).font(.title)
                Text(item.incomenote).font(.subheadline)
            }
            Spacer()
        }
    }
}

struct IncomRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IncomRow(item: itemStore.items[0])
            IncomRow(item: itemStore.items[1])
            IncomRow(item: itemStore.items[2])
        }.previewLayout(.fixed(width: 400,
                               height: 80))
    }
}
