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
    @State var isPremium: Bool = false
    @State private var showSuccessMessage = false
    
    var body: some View {
        List{
            TextField("Name", text: $name)
            
            Picker("Gender", selection: $gender) {
                Text("Male").tag(Gender.male)
                Text("Female").tag(Gender.female)
            }
            
            Picker("isPremium", selection: $isPremium) {
                Text("YES").tag(true)
                Text("NO").tag(false)
            }
            
            Button {
                if !name.isEmpty {
                    let newCustomer = Customer(name: name, gender: gender, isPremium: isPremium)
                    viewModel.addCustomer(newCustomer)
                    showText()
                }
                
                else {
                    
                }
            } label: {
                HStack {
                    Text("Add customer")
                    Spacer()
                    if showSuccessMessage {
                        let message = ""
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

