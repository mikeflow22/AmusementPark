//
//  Entrant.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class Entrant: SwipePass {
    
    var rideAccess: [RideAccess]
    var areaAccess: [AreaAccess]
    var discount: [DiscountType]
    
    init(rideAccess: [RideAccess], areaAccess: [AreaAccess], discount: [DiscountType]){
        self.rideAccess = rideAccess
        self.areaAccess = areaAccess
        self.discount = discount
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

