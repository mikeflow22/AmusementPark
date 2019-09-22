//
//  Employee.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class Employee: EmployeeInformation, Entrant {
    var discount: [Discount]
    var areaAccess: [AreaAccess]
    
    init(discount: [Discount], areaAccess: [AreaAccess], firstName: String, lastName: String, streetAddress: String, cityName: String, state: String, zipCode: Int) {
        self.discount = discount
        self.areaAccess = areaAccess
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, cityName: cityName, state: state, zipCode: zipCode)
        
    }
    
}
