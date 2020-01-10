//
//  SeasonPassGuest.swift
//  Amusement
//
//  Created by Dennis Parussini on 09.01.20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

class SeasonPassGuest: Entrant {
    let dateOfBirth: Date
    
    init(personalInformation: PersonalInformation, dateOfBirth: String?) throws {
        guard let dateOfBirth = dateOfBirth, let birthday = Date.fromString(dateOfBirth) else { throw AmusementParkError.noBirthdayProvided }
        
        self.dateOfBirth = birthday
        
        super.init(entrantType: .guest, passType: .seasonPass, rideAccess: [.allRides, .skipLinePass], areaAccess: [.amusement], discountType: [.foodDiscount, .merchandiseDiscount], personInformation: personalInformation)
    }
}
