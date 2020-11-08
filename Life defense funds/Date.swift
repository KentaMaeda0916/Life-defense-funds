//
//  Date.swift
//  Life defense funds
//
//  Created by まえけん on 2020/06/21.
//  Copyright © 2020 maeken. All rights reserved.
//
import SwiftUI
import Combine

class Items: ObservableObject {
    @Published var Incom: Int = 0
    @Published var Spending: Int = 0
    @Published var Tax: Int = 0
    
    @Published var Spending1 = 0
    @Published var Spending2 = 0
    @Published var Spending3 = 0
    @Published var SpendingOne = 0
    
    @Published var SpendingMonthly = 0
    @Published var TaxMonthly1 = 0
    @Published var minimum: Int = 0
    
    @Published var Target: Int = 0
    @Published var Current: Int = 0
    @Published var ToTheGoal: Int = 0
    
    @Published var AnnualBalance = 0
}

