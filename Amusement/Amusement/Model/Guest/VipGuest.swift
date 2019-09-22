//
//  VipGuest.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class VIPGuest: Entrant {
    var discount: [Discount]
    var areaAccess: [AreaAccess]
    
    init(discount: [Discount], areaAccess: [AreaAccess]) {
        self.discount =  discount
        self.areaAccess = areaAccess
    }
}
