//
//  EmployeeInformation.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
class EmployeeInformation  {
    let firstName: String
    let lastName: String
    var streetAddress: String
    var cityName: String
    var state: String
    var zipCode: Int
    
    init(firstName: String, lastName: String, streetAddress: String, cityName: String, state: String, zipCode: Int){
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.cityName = cityName
        self.state = state
        self.zipCode = zipCode
    }
}
