//
//  PersonListViewModel.swift
//  List
//
//  Created by Ahmed Tarık Bozyak on 16.08.2023.
//

import Foundation

class PersonListViewModel: ObservableObject {
    
    @Published var itPersonList: [Person] = []
    @Published var hrPersonList: [Person] = []
    @Published var lawPersonList: [Person] = []
    
    init(){
        self.itPersonList = Person.itDefaultData()
        self.hrPersonList = Person.hrDefaultData()
        self.lawPersonList = Person.lawDefaultData()
    }
    
    func addPerson(_ person: Person) {
        switch person.department {
        case .IT:
            itPersonList.append(person)
        case .HR:
            hrPersonList.append(person)
        case .LAW:
            lawPersonList.append(person)
        }
    }
    
    func removePerson(_ person: Person) {
        //
    }
    
    
    
}
