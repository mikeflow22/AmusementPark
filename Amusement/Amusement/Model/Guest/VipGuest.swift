//
//  VipGuest.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class VIPGuest: Entrant {
   
    //we dont have to put the variables here because our parent class has them so we can just access them in our init
    
    init() throws {
       super.init(entrantType: .guest, passType: .vipguest, rideAccess: [.allRides, .skipLinePass], areaAccess: [.amusement], discountType: [.foodDiscount, .merchandiseDiscount])
    }
    
    override func swipe(rideAccess: RideAccess) -> Bool {
        //if there is something in the array then the guest has access to the rides
        return !self.rideAccess.isEmpty
    }
    
    override func swipe(areaAccess: AreaAccess) -> Bool {
        return !self.areaAccess.isEmpty
    }
    
    override func swipe(discount: DiscountType) -> Float {
        
        if discount == .foodDiscount {
            return 0.1
        }
        
        if discount == .merchandiseDiscount {
            return 0.2
        }
        
        return 0.0
    }
    
    
}
