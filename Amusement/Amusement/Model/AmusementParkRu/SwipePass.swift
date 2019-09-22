//
//  SwipePass.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
protocol SwipePass {
    func swipe(areaAccess: AreaAccess) -> Bool
    func swipe(rideAccess: RideAccess) -> Bool
    func swipe(discount: Discount) -> Int
}
