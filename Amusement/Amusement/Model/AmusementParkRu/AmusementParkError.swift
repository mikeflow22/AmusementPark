//
//  AmusementParkError.swift
//  Amusement
//
//  Created by Michael Flowers on 9/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

enum AmusementParkError: Error {
    case noPersonalInformation(description: String)
    case noBirthdayProvided(description: String)
    case noFirstNameProvided(description: String)
    case noLastNameProvided(description: String)
    case incorrectDiscountAmount(description: String)
    case notPermittedAccessInArea(description: String)
    case doNotHaveAccessToAllRides(description: String)
    case notPermittedToSkipLines(description: String)
    case notUnderTheFreeChildAgeLimit(description: String)
    
}
