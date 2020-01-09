//
//  EmployeeInformation.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

struct PersonalInformation {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var cityName: String?
    var state: String?
    var zipCode: String?
    
    //create a throwing init of all the properties
    init(firstName: String?, lastName: String?, streetAddress: String?, cityName: String?, state: String?, zipCode: String?) throws {
        guard let firstName = firstName, !firstName.isEmpty else { throw AmusementParkError.noFirstNameProvided }
        guard let lastName = lastName, !lastName.isEmpty else { throw AmusementParkError.noLastNameProvided }
        guard let streetAddress = streetAddress, !streetAddress.isEmpty else { throw AmusementParkError.noStreetAddress }
        guard let cityName = cityName, !cityName.isEmpty else { throw AmusementParkError.noCityName }
        guard let zipCode = zipCode, !zipCode.isEmpty else { throw AmusementParkError.noZipCode }

        self.firstName =  firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.cityName = cityName
        self.state = state
        self.zipCode = zipCode
    }
}
