//
//  Customer.swift
//  SwiftUIList
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import Foundation

struct Customer: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let gender: Gender
    let isPremium: Bool
    
    static func defaultData() -> [Customer] {
        return [
            Customer(name: "Hasan", gender: .male, isPremium: true),
            Customer(name: "Mert", gender: .male, isPremium: true),
            Customer(name: "Gamze", gender: .female, isPremium: false),
            Customer(name: "Neşet", gender: .male, isPremium: false),
            Customer(name: "Burcu", gender: .female, isPremium: true),
        ]
    }
}

enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
}
