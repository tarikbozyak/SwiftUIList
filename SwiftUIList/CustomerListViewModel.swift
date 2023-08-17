//
//  CustomerListViewModel.swift
//  SwiftUIList
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import Foundation

class CustomerListViewModel: ObservableObject {
    
    @Published var customerList: [Customer] = []
    
    init(){
        self.customerList = Customer.defaultData()
    }
    
    func addCustomer(_ customer: Customer) {
        customerList.append(customer)
    }
    
    func removeCustomer(_ indexSet: IndexSet) {
        customerList.remove(atOffsets: indexSet)
    }
    
    func moveCustomer(_ indexSet: IndexSet, _ newPosition: Int) {
        customerList.move(fromOffsets: indexSet, toOffset: newPosition)
    }
    
//    func isContains() -> Bool{
//        let customer = Customer(name: "Hasan", gender: Gender.male, type: CustomerType.premium)
//        return customerList.contains(customer)
//    }
    
}
