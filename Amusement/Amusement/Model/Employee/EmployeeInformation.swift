//
//  EmployeeInformation.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation
protocol EmployeeInformation  {
    var firstName: String { get set }
    var lastName: String { get set }
    var streetAddress: String { get set }
    var cityName: String { get set }
    var state: String { get set }
    var zipCode: Int { get set }
    
//    init(firstName: String, lastName: String, streetAddress: String, cityName: String, state: String, zipCode: Int){
//        self.firstName = firstName
//        self.lastName = lastName
//        self.streetAddress = streetAddress
//        self.cityName = cityName
//        self.state = state
//        self.zipCode = zipCode
//    }
}
