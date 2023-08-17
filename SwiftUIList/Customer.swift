//
//  Customer.swift
//  SwiftUIList
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import Foundation

struct Customer: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let name: String
    let gender: Gender
    let type: CustomerType
    
    static func defaultData() -> [Customer] {
        return [
            Customer(name: "Hasan", gender: .male, type: .premium),
            Customer(name: "Mert", gender: .male, type: .premium),
            Customer(name: "Gamze", gender: .female, type: .standart),
            Customer(name: "Neşet", gender: .male, type: .standart),
            Customer(name: "Burcu", gender: .female, type: .premium),
        ]
    }
}

enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
}

enum CustomerType: String, CaseIterable {
    case standart = "Standart"
    case premium = "Premium"
}
