//
//  SeasonPassGuest.swift
//  Amusement
//
//  Created by Dennis Parussini on 09.01.20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

class SeasonPassGuest: Entrant {
    init(personalInformation: PersonalInformation) {
        super.init(entrantType: .guest, passType: .seasonPass, rideAccess: [.allRides, .skipLinePass], areaAccess: [.amusement], discountType: [.foodDiscount, .merchandiseDiscount], personInformation: personalInformation)
    }
}
