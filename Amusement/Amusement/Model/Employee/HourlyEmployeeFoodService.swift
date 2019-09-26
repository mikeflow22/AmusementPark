//
//  HourlyEmployeeFoodService.swift
//  Amusement
//
//  Created by Michael Flowers on 9/22/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class HourlyEmployeeFoodService: Entrant {
    
    
    init(employeeInformation: EmployeeInformation) throws {
        super.init(rideAccess: [.allRides], areaAccess: [.amusement, .kitchen], discount: [.foodDiscount, .merchandiseDiscount])
        
        guard employeeInformation.firstName != nil else {
            throw AmusementParkError.noFirstNameProvided(description: "Please provide first name.")
//            throw MyCustomError.noBirthdayProvided
//            print(MyCustomError.noBirthdayProvided)
        }
        guard employeeInformation.lastName != nil else {
            throw AmusementParkError.noLastNameProvided(description: "Please Provide last name.")
        }
        guard employeeInformation.streetAddress != nil else {
            throw AmusementParkError.incompleteHomeAddress(description: "Sreet address missing.")
        }
        guard employeeInformation.state != nil else {
            throw AmusementParkError.incompleteHomeAddress(description: "State missing")
        }
        guard employeeInformation.zipCode != nil else {
            throw AmusementParkError.incompleteHomeAddress(description: "Zipcode missing.")
        }
    }
    
    override func swipe(rideAccess: RideAccess) -> Bool {
        return !self.rideAccess.isEmpty
    }
    
    override func swipe(areaAccess: AreaAccess) -> Bool {
        return !self.areaAccess.isEmpty
    }
    
    override func swipe(discount: Discount) -> Float {
        if discount == .foodDiscount {
            return 0.15
        }
        
        if discount == .merchandiseDiscount {
            return 0.25
        }
        return 0.0
    }
    
}
