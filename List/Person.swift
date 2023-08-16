//
//  Person.swift
//  List
//
//  Created by Ahmed Tarık Bozyak on 9.05.2023.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let gender: Gender
    let position: Position
    let department: Department
    
    static func itDefaultData() -> [Person] {
        return [
            //IT
            Person(name: "Mert", gender: .male, position: .specialist, department: .IT),
            Person(name: "Hasan", gender: .male, position: .seniorSpecialist, department: .IT),
            Person(name: "Leyla", gender: .female, position: .seniorSpecialist, department: .IT),
            Person(name: "Burak", gender: .male, position: .teamLead, department: .IT),
            Person(name: "Neşet", gender: .male, position: .teamLead, department: .IT),
            Person(name: "Gül", gender: .female, position: .director, department: .IT),
            Person(name: "Derya", gender: .female, position: .manager, department: .IT),
            Person(name: "Görkem", gender: .male, position: .specialist, department: .IT)
        ]
    }
    
    static func hrDefaultData() -> [Person] {
        return [
            //HR
            Person(name: "Yağız", gender: .male, position: .specialist, department: .HR),
            Person(name: "Hulisi", gender: .male, position: .seniorSpecialist, department: .HR),
            Person(name: "Mustafa", gender: .male, position: .teamLead, department: .HR),
            Person(name: "Mehmet", gender: .male, position: .specialist, department: .HR),
            Person(name: "İnci", gender: .female, position: .director, department: .HR),
            Person(name: "Derya", gender: .female, position: .manager, department: .HR),
        ]
    }
    
    static func lawDefaultData() -> [Person] {
        return [
            //LAW
            Person(name: "Hüseyin", gender: .male, position: .seniorSpecialist, department: .LAW),
            Person(name: "İrem", gender: .female, position: .seniorSpecialist, department: .LAW),
            Person(name: "İlhan", gender: .male, position: .teamLead, department: .LAW),
            Person(name: "Feride", gender: .female, position: .director, department: .LAW),
            Person(name: "Asiye", gender: .female, position: .manager, department: .LAW),
            Person(name: "Recep", gender: .male, position: .specialist, department: .LAW)
        ]
    }
    
    static func defaultData() -> [Person] {
        [
            //IT
            Person(name: "Mert", gender: .male, position: .specialist, department: .IT),
            Person(name: "Hasan", gender: .male, position: .seniorSpecialist, department: .IT),
            Person(name: "Leyla", gender: .female, position: .seniorSpecialist, department: .IT),
            Person(name: "Burak", gender: .male, position: .teamLead, department: .IT),
            Person(name: "Neşet", gender: .male, position: .teamLead, department: .IT),
            Person(name: "Gül", gender: .female, position: .director, department: .IT),
            Person(name: "Derya", gender: .female, position: .manager, department: .IT),
            Person(name: "Görkem", gender: .male, position: .specialist, department: .IT),
            
            //HR
            Person(name: "Yağız", gender: .male, position: .specialist, department: .HR),
            Person(name: "Hulisi", gender: .male, position: .seniorSpecialist, department: .HR),
            Person(name: "Mustafa", gender: .male, position: .teamLead, department: .HR),
            Person(name: "Mehmet", gender: .male, position: .specialist, department: .HR),
            Person(name: "İnci", gender: .female, position: .director, department: .HR),
            Person(name: "Derya", gender: .female, position: .manager, department: .HR),
            
            //LAW
            Person(name: "Hüseyin", gender: .male, position: .seniorSpecialist, department: .LAW),
            Person(name: "İrem", gender: .female, position: .seniorSpecialist, department: .LAW),
            Person(name: "İlhan", gender: .male, position: .teamLead, department: .LAW),
            Person(name: "Feride", gender: .female, position: .director, department: .LAW),
            Person(name: "Asiye", gender: .female, position: .manager, department: .LAW),
            Person(name: "Recep", gender: .male, position: .specialist, department: .LAW)
            
        ]
    }
}

enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
}

enum Position: String, CaseIterable {
    case specialist = "Specialist"
    case seniorSpecialist = "Senior Specialist"
    case teamLead = "Team Lead"
    case manager = "Manager"
    case director = "Director"
}


enum Department: String, CaseIterable {
    case IT = "Information Technology"
    case HR = "Human Resources"
    case LAW = "Law"
}





