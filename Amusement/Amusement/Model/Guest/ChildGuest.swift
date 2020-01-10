//
//  ChildGuest.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class ChildGuest: Entrant {
    //[REVIEW] - dateOfBirth shouldn't be optional since this is a required property for the child guest.
    var dateOfBirth: Date
    
    var age: Int {
        let  dateComponents = Calendar.current.dateComponents([.year], from: dateOfBirth, to: Date())
        return dateComponents.year ?? 0
    }
    
    init(dateOfBirth: String?) throws {
        guard let dateOfBirth = dateOfBirth, let birthday = Date.fromString(dateOfBirth) else { throw AmusementParkError.noBirthdayProvided }
        
        self.dateOfBirth = birthday
        
        super.init(entrantType: .guest, passType: .freeChild, rideAccess: [.allRides], areaAccess: [.amusement], discountType: [])
        
        guard age < 5 else {
            throw AmusementParkError.notUnderTheFreeChildAgeLimit
        }
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
