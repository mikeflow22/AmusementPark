//
//  Entrant.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

protocol Entrant {
    var rideAccess: [RideAccess] { get set }
    var areaAccess: [AreaAccess] { get set }
    var discount: [Discount]  { get set }
    
    
    func swipe(areaAccess: AreaAccess) -> Bool
    
    func swipe(rideAccess: RideAccess) -> Bool
    
    func swipe(discount: Discount) -> Int
    
    
//    init(rideAccess: [RideAccess], areaAccess: [AreaAccess], discount: [Discount]){
//        self.rideAccess = rideAccess
//        self.areaAccess = areaAccess
//        self.discount = discount
//    }
}

//extension Entrant: SwipePass {
//    func swipe(areaAccess: AreaAccess) -> Bool {
//        return false
//    }
//
//    func swipe(rideAccess: RideAccess) -> Bool {
//        return false
//    }
//
//    func swipe(discount: Discount) -> Int {
//        return 0
//    }
//
//
//}
