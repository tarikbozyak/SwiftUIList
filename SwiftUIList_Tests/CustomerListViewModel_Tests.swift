//
//  CustomerListViewModel_Tests.swift
//  SwiftUIList_Tests
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import XCTest
import Combine
@testable import SwiftUIList

// Naming Structure: test_[struct or class]_[variable or function]_[expected result]
// Test Structure: Given, When, Then

final class CustomerListViewModel_Tests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_CustomerListViewModel_addCustomer_shouldContainsCustomer(){
        //Given
        let vm = CustomerListViewModel()
        let customer = Customer(name: "Hasan", gender: Gender.male, type: CustomerType.premium)
        
        //When
        try? vm.addCustomer(customer)
        
        //Then
        let situtation = vm.customerList.contains(customer)
        XCTAssertTrue(situtation)
    }
    
    func test_CustomerListViewModel_addCustomer_shouldThrowDuplicateCustomerError(){
        //Given
        let vm = CustomerListViewModel()
        let customer = Customer(name: "Hasan", gender: Gender.male, type: CustomerType.premium)
        
        //When
        try? vm.addCustomer(customer)
        
        //Then
        XCTAssertThrowsError(try vm.addCustomer(customer), "Should throw dupplicate customer error!") { error in
            let returnedError = error as? CustomerError
            XCTAssertEqual(returnedError, CustomerError.dupplicateCustomer)
        }
    }
    
    func test_CustomerListViewModel_removeCustomer_shouldThrowNoIndexError(){
        //Given
        let vm = CustomerListViewModel()
        
        //When
        let index = IndexSet()
        
        //Then
        XCTAssertThrowsError(try vm.removeCustomer(index), "Should throw no index error!"){ error in
            let returnedError = error as? CustomerError
            XCTAssertEqual(returnedError, CustomerError.noIndex)
        }
    }
    
    func test_CustomerListViewModel_removeCustomer_shouldThrowOutOfIndexError(){
        //Given
        let vm = CustomerListViewModel()
        
        //When
        let index = IndexSet(arrayLiteral: vm.customerList.count + 1)
        
        //Then
        XCTAssertThrowsError(try vm.removeCustomer(index), "Should throw out of index error!"){ error in
            let returnedError = error as? CustomerError
            XCTAssertEqual(returnedError, CustomerError.outOfIndex)
        }
    }
    
    func test_CustomerListViewModel_addRandomCustomer_shouldReturnCustomers(){
        //Given
        let vm = CustomerListViewModel()
        
        //When
        let expectatiton = XCTestExpectation(description: "Should return item after 3 seconds")
        vm.$customerList
            .dropFirst()
            .sink { response in
                expectatiton.fulfill()
            }
            .store(in: &cancellables)
        
        //Then
        wait(for: [expectatiton], timeout: 3)
        XCTAssertGreaterThan(vm.customerList.count, 0)
    }
    
    
}
