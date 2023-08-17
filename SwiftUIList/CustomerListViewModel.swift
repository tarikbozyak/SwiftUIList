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
        addRandomCustomer()
    }
    
    func addRandomCustomer(){
        CustomerMockService.fetch { response, error in
            self.customerList.append(contentsOf: response)
        }
    }
    
    func addCustomer(_ customer: Customer) throws {
        guard !(customerList.map({$0.id}).contains(customer.id)) else {
            throw CustomerError.dupplicateCustomer
        }
        customerList.append(customer)
    }
    
    func removeCustomer(_ indexSet: IndexSet) throws {
        guard let index = indexSet.first.map({Int($0)}) else {
            throw CustomerError.noIndex
        }
        guard customerList.count >= index else {
            throw CustomerError.outOfIndex
        }
        customerList.remove(atOffsets: indexSet)
    }
    
    func moveCustomer(_ indexSet: IndexSet, _ newPosition: Int) {
        customerList.move(fromOffsets: indexSet, toOffset: newPosition)
    }
    
}

enum CustomerError: Error {
    case dupplicateCustomer
    case outOfIndex
    case noIndex
}
