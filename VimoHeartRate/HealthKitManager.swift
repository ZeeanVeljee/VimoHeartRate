//
//  HealthKitManager.swift
//  VimoHeartRate
//
//  Created by Zeean Veljee on 23/04/17.
//  Copyright © 2017 Zed. All rights reserved.
//

import Foundation
import HealthKit


class HealthKitManager: NSObject {
    
    static let healthKitStore = HKHealthStore()
    static var timer: Timer?
    
    static func authorizeHealthKit() {
        
        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        ]
        
        healthKitStore.requestAuthorization(toShare: healthKitTypes,
                                            read: healthKitTypes) { _, _ in }
    }
    
    static func saveMockHeartData() {
        
        // 1. Create a heart rate BPM Sample
        let heartRateType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        let heartRateQuantity = HKQuantity(unit: HKUnit(from: "count/min"),
                                           doubleValue: Double(arc4random_uniform(100) + 60))
        let heartSample = HKQuantitySample(type: heartRateType,
                                           quantity: heartRateQuantity, start: NSDate() as Date, end: NSDate() as Date)
        
        // 2. Save the sample in the store
        healthKitStore.save(heartSample, withCompletion: { (success, error) -> Void in
            if let error = error {
                print("Error saving heart sample: \(error.localizedDescription)")
            }
        })
    }
    
    static func startMockHeartData() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(HealthKitManager.saveMockHeartData),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    static func stopMockHeartData() {
        self.timer?.invalidate()
    }
    
}


