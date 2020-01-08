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
        let today = Date.distantPast
        let  dateComponents = Calendar.current.dateComponents([.year], from: dateOfBirth ?? Date(), to: today)
        return dateComponents.year ?? 0
    }
    
    init(dateOfBirth: Date?) throws {
        guard let bornDay = dateOfBirth else {
            throw AmusementParkError.noBirthdayProvided
        }
        
        super.init(entrantType: .guest, passType: .freeChild, rideAccess: [.allRides], areaAccess: [.amusement], discountType: [])
        
        guard isFree else {
            throw AmusementParkError.notUnderTheFreeChildAgeLimit
            
        }
        
        self.dateOfBirth = bornDay
    }
    
    override func swipe(discount: DiscountType) -> Float {
        return 0.0
    }
    
    override func swipe(areaAccess: AreaAccess) -> Bool {
        return !self.areaAccess.isEmpty
    }
    
    override func swipe(rideAccess: RideAccess) -> Bool {
        return !self.rideAccess.isEmpty
    }
    
}
