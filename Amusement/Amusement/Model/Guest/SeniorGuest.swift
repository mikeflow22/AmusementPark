//
//  SeniorGuest.swift
//  Amusement
//
//  Created by Dennis Parussini on 09.01.20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

class SeniorGuest: Entrant {
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    
    init(firstName: String?, lastName: String?, dateOfBirth: Date?) throws {
        guard let firstName = firstName, !firstName.isEmpty else { throw AmusementParkError.noFirstNameProvided }
        guard let lastName = lastName, !lastName.isEmpty else { throw AmusementParkError.noLastNameProvided }
        guard let dateOfBirth = dateOfBirth else { throw AmusementParkError.noBirthdayProvided }
        
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        
        super.init(entrantType: .guest, passType: .seniorGuest, rideAccess: [.allRides, .skipLinePass], areaAccess: [.amusement], discountType: [.merchandiseDiscount, .foodDiscount])
    }
}
