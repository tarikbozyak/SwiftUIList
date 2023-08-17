//
//  CustomerMockService.swift
//  SwiftUIList
//
//  Created by Ahmed Tarık Bozyak on 17.08.2023.
//

import Foundation

class FetchError: Error {
    let errorDescription: String
    
    init(description: String) {
        self.errorDescription = description
    }
}

typealias FetchCompletionHandler = ([Customer], FetchError?) -> ()


class CustomerMockService {

    private struct Constants {
        static let customerCountRange: ClosedRange<Int> = 50...80
        static let fetchCountRange: ClosedRange<Int> = 10...20
        static let lowWaitTimeRange: ClosedRange<Double> = 0.2...0.8
        static let highWaitTimeRange: ClosedRange<Double> = 1.0...1.5
        static let errorProbability = 0.05
        static let backendBugTriggerProbability = 0.35
    }

    private static var customer: [Customer] = []
    private static let operationsQueue = DispatchQueue.init(
        label: "data_source_operations_queue",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .inherit,
        target: nil
    )
    
    public class func fetch(_ completionHandler: @escaping FetchCompletionHandler) {
        DispatchQueue.global().async {
            operationsQueue.sync {
                initializeDataIfNecessary()
                let (response, error, waitTime) = processRequest()
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
    
    private class func processRequest() -> ([Customer], FetchError?, Double) {
        var error: FetchError? = nil
        var response: [Customer] = []
        let isError = RandomUtils.roll(forProbabilityGTZero: Constants.errorProbability)
        var waitTime: Double!
        
        if isError {
            waitTime = RandomUtils.generateRandomDouble(inClosedRange: Constants.lowWaitTimeRange)
            error = FetchError(description: "Internal Server Error")
        }
        else {
            waitTime = RandomUtils.generateRandomDouble(inClosedRange: Constants.highWaitTimeRange)
            let fetchCount = RandomUtils.generateRandomInt(inClosedRange: Constants.fetchCountRange)
            
            response = Array(customer[0..<fetchCount])
            
            if RandomUtils.roll(forProbabilityGTZero: Constants.backendBugTriggerProbability) {
                error = FetchError(description: "Backend Error!")
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


