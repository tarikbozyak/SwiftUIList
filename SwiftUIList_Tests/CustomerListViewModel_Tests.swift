//
//  CustomerListViewModel_Tests.swift
//  SwiftUIList_Tests
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import XCTest
@testable import SwiftUIList

final class CustomerListViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CustomerListViewModel_ListNotEmpty(){
        let vm = CustomerListViewModel()
        XCTAssertTrue(vm.customerList.count>0)
    }
    
    func test_CustomerListViewModel_CheckAddCustomer(){
        let vm = CustomerListViewModel()
        let customer = Customer(name: "Hasan", gender: Gender.male, type: CustomerType.premium)
        vm.addCustomer(customer)
        let situtation = vm.customerList.contains(customer)
        XCTAssertTrue(situtation)
    }

}
