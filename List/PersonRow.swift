//
//  PersonRow.swift
//  List
//
//  Created by Ahmed Tarık Bozyak on 9.05.2023.
//

import SwiftUI

struct PersonRow: View {
    
    let person : Person
    
    init(_ person: Person) {
        self.person = person
    }
    
    var body: some View {
        HStack {
            Text(person.gender == .male ? "👨‍💼" : "🙎‍♀️")
            VStack(alignment: .leading) {
                Text(person.name)
                Text(person.position.rawValue)
                    .foregroundColor(.gray.opacity(0.7))
                    .font(.caption)
            }
        }
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonRow(Person.defaultData().first!)
    }
}
