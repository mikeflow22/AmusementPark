//
//  HourlyEmployeeMaintenance.swift
//  Amusement
//
//  Created by Michael Flowers on 9/22/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class HourlyEmployeeMaintenance: Entrant {
    
    init(employeeInformation: PersonalInformation) throws {
        super.init(entrantType: .hourlyEmployee, passType: .hourlyEmployeeMaintenance, rideAccess: [.allRides], areaAccess: [.amusement, .kitchen, .rideControl, .maintenance], discountType: [.foodDiscount, .merchandiseDiscount], personInformation: employeeInformation)
        
        //[REVIEW] - As discussed during our call I would change those and all other initializers to the one you have PersonalInformation
        guard employeeInformation.firstName != nil else {
            throw AmusementParkError.noFirstNameProvided
        }
        guard employeeInformation.lastName != nil else {
            throw AmusementParkError.noLastNameProvided
        }
        guard employeeInformation.streetAddress != nil else {
            throw AmusementParkError.noStreetAddress
        }
        guard employeeInformation.state != nil else {
            throw AmusementParkError.noState
        }
        guard employeeInformation.zipCode != nil else {
            throw AmusementParkError.noZipCode
        }
    }
    
    override func swipe(rideAccess: RideAccess) -> Bool {
        return !self.rideAccess.isEmpty
    }
    
    override func swipe(areaAccess: AreaAccess) -> Bool {
        return !self.areaAccess.isEmpty
    }
    
    override func swipe(discount: DiscountType) -> Float {
        if discount == .foodDiscount {
            return 0.15
        }
        
        if discount == .merchandiseDiscount {
            return 0.25
        }
        return 0.0
    }
}
