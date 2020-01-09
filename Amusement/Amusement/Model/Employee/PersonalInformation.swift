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
        
        
        guard let firstName = firstName, !firstName.isEmpty else {
            throw AmusementParkError.noFirstNameProvided
        }
          
        
                guard lastName != nil else {
                    throw AmusementParkError.noLastNameProvided
                }
                if lastName?.count == 0 {
                    throw AmusementParkError.noLastNameProvided
                }
        
                guard streetAddress != nil else {
                    throw AmusementParkError.noStreetAddress
                }
                if streetAddress?.count == 0 {
                    throw  AmusementParkError.noStreetAddress
                }
        
                guard cityName != nil else {
                    throw AmusementParkError.noCityName
                }
                if cityName?.count == 0 {
                    throw  AmusementParkError.noCityName
                }
        
                guard zipCode != nil else {
                    throw AmusementParkError.noZipCode
                }
                if zipCode?.count == 0 {
                    throw AmusementParkError.noZipCode
                }
        
        self.firstName =  firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.cityName = cityName
        self.state = state
        self.zipCode = zipCode
    }
    
    //[REVIEW] - Delete code you don't need anymore. There are a couple of files in your project that only have commented code in them. You should get rid of those too.
//    func testCases() throws {
//        guard firstName != nil else {
//            throw AmusementParkError.noFirstNameProvided
//        }
//        if firstName?.count == 0 {
//            throw AmusementParkError.noFirstNameProvided
//        }
//
//        guard lastName != nil else {
//            throw AmusementParkError.noLastNameProvided
//        }
//        if lastName?.count == 0 {
//            throw AmusementParkError.noLastNameProvided
//        }
//
//        guard streetAddress != nil else {
//            throw AmusementParkError.noStreetAddress
//        }
//        if streetAddress?.count == 0 {
//            throw  AmusementParkError.noStreetAddress
//        }
//
//        guard cityName != nil else {
//            throw AmusementParkError.noCityName
//        }
//        if cityName?.count == 0 {
//            throw  AmusementParkError.noCityName
//        }
//
//        guard zipCode != nil else {
//            throw AmusementParkError.noZipCode
//        }
//        if zipCode?.count == 0 {
//            throw AmusementParkError.noZipCode
//        }
//
//
//    }
}
