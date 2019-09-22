//
//  ChildGuest.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation


class ChildGuest: Entrant {
    
    var discount: [Discount]
    var areaAccess: [AreaAccess]
    
    var isFree: Bool {
        return age < 5
    }
    
    var dateOfBirth: Date
    var age:  Int {
        let today = Date()
        let  dateComponents = Calendar.current.dateComponents([.year], from: today)
        return dateComponents.year ?? 0
    }
    
    
    init(discount: [Discount], areaAccess: [AreaAccess], dateOfBirth: Date) {
        self.discount =  discount
        self.areaAccess = areaAccess
        self.dateOfBirth = dateOfBirth
    }
}
