//
//  Vendor.swift
//  Amusement
//
//  Created by Dennis Parussini on 09.01.20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

class Vendor: Entrant {
    enum VendorCompany: String {
        case acme = "Acme"
        case orkin = "Orkin"
        case fedex = "Fedex"
        case nwElectrical = "NW Electrical"
    }
    
    let firstName: String
    let lastName: String
    let company: VendorCompany
    let dateOfBirth: Date
    let dateOfVisit: Date
    
    init(firstName: String?, lastName: String?, company: VendorCompany?, dateOfBirth: Date?, dateOfVisit: Date = Date()) throws {
        guard let firstName = firstName, !firstName.isEmpty else { throw AmusementParkError.noFirstNameProvided }
        guard let lastName = lastName, !lastName.isEmpty else { throw AmusementParkError.noLastNameProvided }
        guard let company = company else { throw AmusementParkError.noCompanyProvided }
        guard let dateOfBirth = dateOfBirth else { throw AmusementParkError.noBirthdayProvided }
        
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.dateOfBirth = dateOfBirth
        self.dateOfVisit = dateOfVisit
        
        var areas = [AreaAccess]()
        switch company {
        case .acme: areas = [.kitchen]
        case .orkin: areas = [.amusement, .rideControl, .kitchen]
        case .fedex: areas = [.maintenance, .office]
        case .nwElectrical: areas = [.amusement, .rideControl, .kitchen, .maintenance, .office]
        }
        
        super.init(entrantType: .hourlyEmployee, passType: .vendor, rideAccess: [], areaAccess: areas, discountType: [])
    }
}
