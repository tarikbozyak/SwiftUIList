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

struct Character {
    let name: String
    let gender: Gender
}

extension Customer {
    
    private static let characters = [
        Character(name: "Fatma", gender: .female),
        Character(name: "Mehmet", gender: .male),
        Character(name: "Ayşe", gender: .female),
        Character(name: "Mustafa", gender: .male),
        Character(name: "Emine", gender: .female),
        Character(name: "Ahmet", gender: .male),
        Character(name: "Hatice", gender: .female),
        Character(name: "Ali", gender: .male),
        Character(name: "Zeynep", gender: .female),
        Character(name: "Hüseyin", gender: .male),
        Character(name: "Elif", gender: .female),
        Character(name: "Hasan", gender: .male),
        Character(name: "İbrahim", gender: .male),
        Character(name: "Can", gender: .male),
        Character(name: "Murat", gender: .male),
        Character(name: "Özlem", gender: .female),
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
    
    
    private static func generateRandomCharacter() -> (fullName: String, gender: Gender) {
        let characterCount = Customer.characters.count
        let lastNamesCount = Customer.lastNames.count

        let character = Customer.characters[Int.random(in: 0..<characterCount)]
        let lastName = Customer.lastNames[Int.random(in: 0..<lastNamesCount)]

        return ("\(character.name) \(lastName)", character.gender)
    }
    
    static func generateRandomCustomer() -> Self {
        let character = generateRandomCharacter()
        let type = CustomerType.allCases.randomElement() ?? .standart
        return Customer(name: character.fullName, gender: character.gender, type: type)
    }
    
    static func generateRandomCustomerData(numberOfData: Int) -> [Self] {
        var data = [Self]()
        for _ in 0..<numberOfData {
            data.append(generateRandomCustomer())
        }
        return data
    }
}
