//
//  CustomerListView.swift
//  SwiftUIList
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import SwiftUI

struct CustomerListView: View {
    
    @StateObject var vm = CustomerListViewModel()
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                if !vm.isLoading && vm.customerList.count > 0 {
                    List {
                        Section {
                            ForEach(vm.customerList) { customer in
                                CustomerRow(customer)
                            }.onDelete { indexSet in
                                try? vm.removeCustomer(indexSet)
                            }.onMove { indexSet, newOffset in
                                try? vm.moveCustomer(indexSet, newOffset)
                            }
                        } header: {
                            Text("Customer List")
                        } footer: {
                            Text("Count : \($vm.customerList.count)")
                        }
                    }
                    .listStyle(.grouped)
                }
                
                else {
                    ProgressView()
                        .padding(.bottom, 2)
                    Text("Loading")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .bold()
                    Spacer()
                }
            }
            
            .navigationTitle("Customer")
            .toolbar {
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                }

                EditButton()
            }
            .sheet(isPresented: $isPresented) {
                CustomerAddView(viewModel: vm)
                    .presentationDetents([.medium, .fraction(0.35)])
            }
        }
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerListView()
    }
}
