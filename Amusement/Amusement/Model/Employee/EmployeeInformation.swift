//
//  EmployeeInformation.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class EmployeeInformation: Entrant  {
    var rideAccess: [RideAccess]
    
    var areaAccess: [AreaAccess]
    
    var discount: [Discount]
    
    func swipe(areaAccess: AreaAccess) -> Bool {
        return true
    }
    
    func swipe(rideAccess: RideAccess) -> Bool {
        return true
    }
    
    func swipe(discount: Discount) -> Int {
        return 10
    }
    
    var firstName: String
    var lastName: String
    var streetAddress: String
    var cityName: String
    var state: String
    var zipCode: Int
    
    init(firstName: String, lastName: String, streetAddress: String, cityName: String, state: String, zipCode: Int, rideAccess: [RideAccess] = [.allRides],areaAccess: [AreaAccess] = [.amusement]){
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.cityName = cityName
        self.state = state
        self.zipCode = zipCode
    }
}
