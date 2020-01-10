//
//  ContractEmployee.swift
//  Amusement
//
//  Created by Dennis Parussini on 09.01.20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

class ContractEmployee: Entrant, BirthdayProvidable {
    enum ProjectNumber: Int {
        case oneThousandOne = 1001
        case oneThousandTwo = 1002
        case oneThousandThree = 1003
        case twoThousandOne = 2001
        case twoThousandTwo = 2002
    }
    
    let projectNumber: ProjectNumber
    let SSN: String
    let dateOfBirth: Date

    init(personalInformation: PersonalInformation, projectNumber: ProjectNumber, SSN: String?, dateOfBirth: String?) throws {
        var areas = [AreaAccess]()
        switch projectNumber {
        case .oneThousandOne: areas = [.amusement, .rideControl]
        case .oneThousandTwo: areas = [.amusement, .rideControl, .maintenance]
        case .oneThousandThree: areas = [.amusement, .rideControl, .kitchen, .maintenance, .office]
        case .twoThousandOne: areas = [.office]
        case .twoThousandTwo: areas = [.kitchen, .maintenance]
        }
        
        self.projectNumber = projectNumber
        
        guard let SSN = SSN, !SSN.isEmpty else { throw AmusementParkError.noSSNProvided }
        guard let dateOfBirth = dateOfBirth, let birthday = Date.fromString(dateOfBirth) else { throw AmusementParkError.noBirthdayProvided }
        
        self.dateOfBirth = birthday
        self.SSN = SSN
        
        super.init(entrantType: .hourlyEmployee, passType: .contractEmployee, rideAccess: [], areaAccess: areas, discountType: [], personInformation: personalInformation)
    }
}
