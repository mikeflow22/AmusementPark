//
//  Employee.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class Employee: EmployeeInformation {
    
    
    init(discount: [Discount], areaAccess: [AreaAccess], firstName: String, lastName: String, streetAddress: String, cityName: String, state: String, zipCode: Int) {
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, cityName: cityName, state: state, zipCode: zipCode)
        self.discount = discount
        self.areaAccess = areaAccess
        
    }
}
extension Employee: Entrant {
    var rideAccess: [RideAccess] {
        get {
            return []
        }
        set {
        
        }
    }
    
    var areaAccess: [AreaAccess] {
        get {
            return [.amusement, .kitchen, .maintenance, .office, .rideControl]
        }
        set {
            
        }
    }
    
    var discount: [Discount] {
        get {
            return [.foodDiscount(amount: 10), .merchandiseDiscount(amount: 25)]
        }
        set {
            
        }
    }
    
    func swipe(areaAccess: AreaAccess) -> Bool {
        return true
    }
    
    func swipe(rideAccess: RideAccess) -> Bool {
        return true
    }
    
    func swipe(discount: Discount) -> Int {
        return 10
    }
    
    
 
}

