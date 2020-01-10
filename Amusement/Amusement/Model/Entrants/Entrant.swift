//
//  Entrant.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class Entrant: SwipePass {
    var entrantType: EntrantType
    var passType: PassType
    var discountType: [DiscountType]
    var rideAccess: [RideAccess]
    var areaAccess: [AreaAccess]
    var personInformation: PersonalInformation?
   
    init(entrantType: EntrantType, passType: PassType,  rideAccess: [RideAccess], areaAccess: [AreaAccess], discountType: [DiscountType], personInformation: PersonalInformation? = nil){
        self.entrantType = entrantType
        self.passType = passType
        self.rideAccess = rideAccess
        self.areaAccess = areaAccess
        self.discountType = discountType
        self.personInformation = personInformation
    }
    
    func swipe(areaAccess: AreaAccess) -> Bool {
        return false
    }
    
    func swipe(rideAccess: RideAccess) -> Bool {
        return false
    }
    
    func swipe(discount: DiscountType) -> Float {
        return 0.0
    }
}

protocol BirthdayProvidable: Entrant {
    var dateOfBirth: Date { get }
}
