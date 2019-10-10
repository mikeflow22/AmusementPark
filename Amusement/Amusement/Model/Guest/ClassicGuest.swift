//
//  ClassicGuest.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class ClassicGuest: Entrant {

    init() throws {
        super.init(entrantType: .guest, passType: .classicGuest, rideAccess: [.allRides], areaAccess: [.amusement], discountType: [])
    }
    
    override func swipe(areaAccess: AreaAccess) -> Bool {
        return self.areaAccess.contains(.amusement)
    }
    
    override func swipe(rideAccess: RideAccess) -> Bool {
        return self.rideAccess.contains(.allRides)
    }
   override func swipe(discount: DiscountType) -> Float {
        return 0.0
    }
    
}

