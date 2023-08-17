//
//  CustomerAddView.swift
//  SwiftUIList
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import SwiftUI

struct CustomerAddView: View {
    
    var viewModel: CustomerListViewModel
    
    @State var name: String = ""
    @State var gender: Gender = .male
    @State var type: CustomerType = .standart
    @State private var showSuccessMessage = false
    
    var body: some View {
        List{
            TextField("Name", text: $name)
            
            Picker("Gender", selection: $gender) {
                Text("Male").tag(Gender.male)
                Text("Female").tag(Gender.female)
            }
            
            Picker("Account Type", selection: $type) {
                Text("Standart").tag(CustomerType.standart)
                Text("Premium").tag(CustomerType.premium)
            }
            
            Button {
                if !name.isEmpty {
                    let newCustomer = Customer(name: name, gender: gender, type: type)
                    try? viewModel.addCustomer(newCustomer)
                    showText()
                }
                
                else {
                    
                }
            } label: {
                HStack {
                    Text("Add customer")
                    Spacer()
                    if showSuccessMessage {
                        Text("Customer added..")
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

