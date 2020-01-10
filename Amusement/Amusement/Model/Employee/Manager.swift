//
//  Manager.swift
//  Amusement
//
//  Created by Michael Flowers on 9/22/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

//This is missing in your current implementation. If you expand the cell in the Business Rules Matrix you will see three tiers for the manager.
enum ManagerType {
    case shiftManager, generalManager, seniorManager
}

class Manager: Entrant {
    var managerType: ManagerType
    let SSN: String
    let dateOfBirth: Date
    
    init(employeeInformation: PersonalInformation, managerType: ManagerType, SSN: String?, dateOfBirth: String?) throws {
        guard let SSN = SSN, !SSN.isEmpty else { throw AmusementParkError.noSSNProvided }
        guard let dateOfBirth = dateOfBirth, let birthday = Date.fromString(dateOfBirth) else { throw AmusementParkError.noBirthdayProvided }
        
        self.managerType = managerType
        self.SSN = SSN
        self.dateOfBirth = birthday
        
        super.init(entrantType: .manager, passType: .manager, rideAccess: [.allRides], areaAccess: [.amusement, .kitchen, .rideControl, .maintenance, .office], discountType: [.foodDiscount, .merchandiseDiscount], personInformation: employeeInformation)
    }
    
    override func swipe(rideAccess: RideAccess) -> Bool {
        return !self.rideAccess.isEmpty
    }
    
    override func swipe(areaAccess: AreaAccess) -> Bool {
        return !self.areaAccess.isEmpty
    }
    
    override func swipe(discount: DiscountType) -> Float {
        if discount == .foodDiscount {
            return 0.25
        }
        
        if discount == .merchandiseDiscount {
            return 0.25
        }
        return 0.0
    }
}


