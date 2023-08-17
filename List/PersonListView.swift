//
//  PersonListView.swift
//  List
//
//  Created by Ahmed Tarık Bozyak on 9.05.2023.
//

import SwiftUI

struct PersonListView: View {
    
    @State var itPersonList: [Person] = Person.itDefaultData()
    @State var hrPersonList: [Person] = Person.hrDefaultData()
    @State var lawPersonList: [Person] = Person.lawDefaultData()
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            List {
                PersonSectionView(personList: $itPersonList, header: Department.IT.rawValue)
                PersonSectionView(personList: $hrPersonList, header: Department.HR.rawValue)
                PersonSectionView(personList: $lawPersonList, header: Department.LAW.rawValue)
            }
            .listStyle(.grouped)
            .navigationTitle("Person")
            .toolbar {
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                }

                EditButton()
            }
            .sheet(isPresented: $isPresented) {
                PersonAddView(itPersonList: $itPersonList, hrPersonList: $hrPersonList, lawPersonList: $lawPersonList)
                    .presentationDetents([.medium, .fraction(0.25)])
            }
        }
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}

struct PersonSectionView: View {
    
    @Binding var personList: [Person]
    var header: String
    
    var body: some View {
        Section {
            ForEach(personList) { person in
                PersonRow(person)
            }.onDelete { indexSet in
                personList.remove(atOffsets: indexSet)
            }.onMove { indicies, newOffset in
                personList.move(fromOffsets: indicies, toOffset: newOffset)
            }
        } header: {
            Text(header)
        } footer: {
            Text("Count : \($personList.count)")
        }
    }
}

struct PersonDisclosureSectionView: View {
    
    @Binding var personList: [Person]
    let departmant: Department
    
    var body: some View {
        Section{
            DisclosureGroup(departmant.rawValue) {
                ForEach(personList) { person in
                    PersonRow(person)
                }.onDelete { indexSet in
                    personList.remove(atOffsets: indexSet)
                }.onMove { indicies, newOffset in
                    personList.move(fromOffsets: indicies, toOffset: newOffset)
                }
            }
        }
    }
}
