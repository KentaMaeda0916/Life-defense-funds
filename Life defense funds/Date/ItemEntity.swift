//
//  ItemEntity.swift
//  Life defense funds
//
//  Created by まえけん on 2020/05/08.
//  Copyright © 2020 maeken. All rights reserved.
//
import Foundation

enum Income:Int16 {
    case Salary
    case Bonus
    case Other
    
    var Title:String {
        IncomeTitle[Int(self.rawValue)]
    }
    var Note:String {
        IncomeNote[Int(self.rawValue)]
    }
}

var IncomeTitle = ["給与",
                   "ボーナス",
                   "その他"]

var IncomeNote = ["総支給額",
                 "ボーナス",
                 "給付金、事業所得"]

struct ItemEntity : Codable,Identifiable {
    public var id: String
    public var income: Int16
    public var note: Int16

    public var incometitle: String {
        Income(rawValue: self.income)!.Title
    }
    
    public var incomenote: String {
        Income(rawValue: self.note)!.Note
    }
}
    
enum Spending:Int16 {
    case tax
    case deduction
    case Cost_of_living_M
    case Cost_of_living_Y
    case Yutori_M
    case Yutori_Y
}
var SpendingArray = ["税金",
                     "給与天引き",
                     "生活費（月々）",
                     "生活費（年間）",
                     "ゆとり費（月々）",
                     "ゆとり費（年間）"]

