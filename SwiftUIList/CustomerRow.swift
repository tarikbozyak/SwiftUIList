//
//  CustomerRow.swift
//  SwiftUIList
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import Foundation
import SwiftUI

struct CustomerRow: View {
    
    let customer : Customer
    var info: String {
        return customer.isPremium ? "Premium" : "Standart"
    }
    
    init(_ customer: Customer) {
        self.customer = customer
    }
    
    var body: some View {
        HStack {
            Text(customer.gender == .male ? "👨‍💼" : "🙎‍♀️")
            VStack(alignment: .leading) {
                Text(customer.name)
                Text(info)
                    .foregroundColor(.gray.opacity(0.7))
                    .font(.caption)
            }
        }
    }
}

struct CustomerRow_Previews: PreviewProvider {
    static var previews: some View {
        CustomerRow(Customer.defaultData().first!)
    }
}

