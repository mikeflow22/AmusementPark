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
    var discount: [Discount]
    
    init(rideAccess: [RideAccess], areaAccess: [AreaAccess], discount: [Discount]){
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
    
    func swipe(discount: Discount) -> Int {
        return 0
    }
    
    

}

