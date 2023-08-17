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

extension Customer {
    
    private static let firstNames = [
        "Fatma",
        "Mehmet",
        "Ayşe",
        "Mustafa",
        "Emine",
        "Ahmet",
        "Hatice",
        "Ali",
        "Zeynep",
        "Hüseyin",
        "Elif",
        "Hasan",
        "İbrahim",
        "Can",
        "Murat",
        "Özlem"
    ]
    
    private static let lastNames = [
        "Yılmaz",
        "Şahin",
        "Demir",
        "Çelik",
        "Şahin",
        "Öztürk",
        "Kılıç",
        "Arslan",
        "Taş",
        "Aksoy",
        "Barış",
        "Dalkıran"
    ]
    
    
    private static func generateRandomFullName() -> String {
        let firstNamesCount = Customer.firstNames.count
        let lastNamesCount = Customer.lastNames.count

        let firstName = Customer.firstNames[Int.random(in: 0..<firstNamesCount)]
        let lastName = Customer.lastNames[Int.random(in: 0..<lastNamesCount)]

        return "\(firstName) \(lastName)"
    }
    
    static func generateRandomCustomer() -> Self {
        let fullName = generateRandomFullName()
        let type = CustomerType.allCases.randomElement() ?? .standart
        return Customer(name: fullName, gender: Gender.allCases.randomElement()!, type: type)
    }
    
    static func generateRandomCustomerData(numberOfData: Int) -> [Self] {
        var data = [Self]()
        for _ in 0..<numberOfData {
            data.append(generateRandomCustomer())
        }
        return data
    }
}
