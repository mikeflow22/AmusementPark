//
//  ChildGuest.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation


class ChildGuest: Entrant {

    var isFree: Bool {
        return age < 5
    }
    
    var dateOfBirth: Date?
    var age:  Int {
        let today = Date()
        let  dateComponents = Calendar.current.dateComponents([.year], from: dateOfBirth!, to: today)
        return dateComponents.year ?? 0
    }
    
    init(dateOfBirth: Date?) throws {
        guard let bornDay = dateOfBirth else {
            throw AmusementParkError.noBirthdayProvided(description: "Missing Date of Birth")
        }
        
        super.init(rideAccess: [.allRides, .skipLinePass], areaAccess: [.amusement], discount: [.foodDiscount, .merchandiseDiscount])
        
        guard isFree else {
            throw AmusementParkError.notUnderTheFreeChildAgeLimit(description: "Child must be younger than \(5) years old")
        }
        
        self.dateOfBirth = bornDay
    }
    
    override func swipe(discount: Discount) -> Float {
        return 0.0
    }
    
    override func swipe(areaAccess: AreaAccess) -> Bool {
        return !self.areaAccess.isEmpty
    }
    
    override func swipe(rideAccess: RideAccess) -> Bool {
        return !self.rideAccess.isEmpty
    }
    
}
