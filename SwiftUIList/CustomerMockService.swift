//
//  CustomerMockService.swift
//  SwiftUIList
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import Foundation

public class FetchResponse {
    let customer: [Customer]
    let next: String?
    
    init(customer: [Customer], next: String?) {
        self.customer = customer
        self.next = next
    }
}


public class FetchError: Error {
    let errorDescription: String
    
    init(description: String) {
        self.errorDescription = description
    }
}

public typealias FetchCompletionHandler = (FetchResponse?, FetchError?) -> ()


public class CustomerMockService {

    private struct Constants {
        static let customerCountRange: ClosedRange<Int> = 50...80 // lower bound must be > 0
        static let fetchCountRange: ClosedRange<Int> = 10...20 // lower bound must be > 0
        static let lowWaitTimeRange: ClosedRange<Double> = 0.0...0.3 // lower bound must be >= 0.0
        static let highWaitTimeRange: ClosedRange<Double> = 0.5...1.0 // lower bound must be >= 0.0
        static let errorProbability = 0.05 // must be > 0.0
        static let backendBugTriggerProbability = 0.35 // must be > 0.0
        static let emptyFirstResultsProbability = 0.01 // must be > 0.0
    }

    private static var customer: [Customer] = []
    private static let operationsQueue = DispatchQueue.init(
        label: "data_source_operations_queue",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .inherit,
        target: nil
    )
    
    public class func fetch(next: String?, _ completionHandler: @escaping FetchCompletionHandler) {
        DispatchQueue.global().async {
            operationsQueue.sync {
                initializeDataIfNecessary()
                let (response, error, waitTime) = processRequest(next)
                DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                    completionHandler(response, error)
                }
            }
        }
    }
    
    private class func initializeDataIfNecessary() {
        guard customer.isEmpty else { return }
        customer = Customer.generateRandomCustomerData(numberOfData: Int.random(in: Constants.customerCountRange)).shuffled()
    }
    
    private class func processRequest(_ next: String?) -> (FetchResponse?, FetchError?, Double) {
        var error: FetchError? = nil
        var response: FetchResponse? = nil
        let isError = RandomUtils.roll(forProbabilityGTZero: Constants.errorProbability)
        var waitTime: Double!
        
        if isError {
            waitTime = RandomUtils.generateRandomDouble(inClosedRange: Constants.lowWaitTimeRange)
            error = FetchError(description: "Internal Server Error")
        }
        else {
            waitTime = RandomUtils.generateRandomDouble(inClosedRange: Constants.highWaitTimeRange)
            let fetchCount = RandomUtils.generateRandomInt(inClosedRange: Constants.fetchCountRange)
            let customerCount = customer.count

            if let next = next, (Int(next) == nil || Int(next)! < 0) {
                error = FetchError(description: "Parameter error")
            }
            else {
                let endIndex: Int = min(customerCount, fetchCount + (next == nil ? 0 : (Int(next!) ?? 0)))
                let beginIndex: Int = next == nil ? 0 : min(Int(next!)!, endIndex)
                var responseNext: String? = endIndex >= customerCount ? nil : String(endIndex)
                
                var fetchedCustomer: [Customer] = Array(customer[beginIndex..<endIndex])
                if beginIndex > 0 && RandomUtils.roll(forProbabilityGTZero: Constants.backendBugTriggerProbability) {
                    error = FetchError(description: "Backend Error!")
                }
                else if beginIndex == 0 && RandomUtils.roll(forProbabilityGTZero: Constants.emptyFirstResultsProbability) {
                    fetchedCustomer = []
                    responseNext = nil
                }
                response = FetchResponse(customer: fetchedCustomer, next: responseNext)
            }
        }

        return (response, error, waitTime)
    }
    
}

//Util
fileprivate class RandomUtils {
    

    class func generateRandomInt(inClosedRange range: ClosedRange<Int>) -> Int {
        return Int.random(in: range)
    }

    class func generateRandomInt(inRange range: Range<Int>) -> Int {
        return Int.random(in: range)
    }

    
    class func generateRandomDouble(inClosedRange range: ClosedRange<Double>) -> Double {
        return Double.random(in: range)
    }
    
    class func roll(forProbabilityGTZero probability: Double) -> Bool {
        let random = Double.random(in: 0.0...1.0)
        return random <= probability
    }
}


