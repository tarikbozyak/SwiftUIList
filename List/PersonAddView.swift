//
//  PersonAddView.swift
//  List
//
//  Created by Ahmed Tarık Bozyak on 9.05.2023.
//

import SwiftUI

struct PersonAddView: View {
    
    @Binding var itPersonList: [Person]
    @Binding var hrPersonList: [Person]
    @Binding var lawPersonList: [Person]
    
    @State var name: String = ""
    @State var gender: Gender = .male
    @State var position: Position = .specialist
    @State var department: Department = .IT
    
    @State private var showSuccessMessage = false
    
    var body: some View {
        
        List{
            TextField("Name", text: $name)
            
            Picker("Gender", selection: $gender) {
                Text("Male").tag(Gender.male)
                Text("Female").tag(Gender.female)
            }
            
            Picker("Position", selection: $position) {
                Text(Position.specialist.rawValue).tag(Position.specialist)
                Text(Position.seniorSpecialist.rawValue).tag(Position.seniorSpecialist)
                Text(Position.teamLead.rawValue).tag(Position.teamLead)
                Text(Position.manager.rawValue).tag(Position.manager)
                Text(Position.director.rawValue).tag(Position.director)
            }
            
            Picker("Department", selection: $department) {
                Text(Department.IT.rawValue).tag(Department.IT)
                Text(Department.LAW.rawValue).tag(Department.LAW)
                Text(Department.HR.rawValue).tag(Department.HR)
            }
            
            Button {
                if !name.isEmpty {
                    let newPerson = Person(name: name, gender: gender, position: position, department: department)
                    switch department {
                    case .IT: itPersonList.append(newPerson)
                    case .HR: hrPersonList.append(newPerson)
                    case .LAW: lawPersonList.append(newPerson)
                    }
                    showText()
                }
                
                else {
                    
                }
            } label: {
                HStack {
                    Text("Add person")
                    Spacer()
                    if showSuccessMessage {
                        let message = ""
                        Text("Person added..")
                            .foregroundColor(.green)
                            .font(.footnote)
                    }
                }
            }
        }
    }
    
    func showText(){
        showSuccessMessage = true
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            showSuccessMessage = false
        }
    }
}

