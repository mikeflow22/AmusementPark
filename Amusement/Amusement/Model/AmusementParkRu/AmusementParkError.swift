//
//  AmusementParkError.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

//[REVIEW] - For future reference this could also conform to LocalizedError. You would then need to override `errorDescription` rather than `localizedDescription`. LocalizedError simplifies localization of your app since the system can figure out the language to use when displaying the error.
enum AmusementParkError: Error {
    case noPersonalInformation
    case noBirthdayProvided
    case noFirstNameProvided
    case noLastNameProvided
    case incompleteHomeAddress
    case noStreetAddress
    case noCityName
    case noState
    case noZipCode
    case incorrectDiscountAmount
    case notPermittedAccessInArea
    case doNotHaveAccessToAllRides
    case notPermittedToSkipLines
    case notUnderTheFreeChildAgeLimit
    
    
    var localizedDescription: String {
        switch self {
        case .noPersonalInformation:
            return "No personal information was entered. enter that shit bitch."
        case .noBirthdayProvided:
            return "No birthday for you sucka because you didn't enter it"
        case .noFirstNameProvided:
            return "No first name provided"
        case .noLastNameProvided:
            return "no last name provided."
        case .incompleteHomeAddress:
            return "Incomplete home address"
        case .noStreetAddress:
            return "missing street address"
        case .noCityName:
            return "Missing city name"
        case .noState:
            return "Missing State"
        case .noZipCode:
            return "Missing zipcode"
        case .incorrectDiscountAmount:
            return "Discount amount is incorrect"
        case .notPermittedAccessInArea:
            return "You dont belong in this area"
        case .doNotHaveAccessToAllRides:
            return "You do not have access to all of the rides"
        case .notPermittedToSkipLines:
            return "You can't skip lines bro"
        case .notUnderTheFreeChildAgeLimit:
            return "Error your child is not young enough"
        }
    }
}
