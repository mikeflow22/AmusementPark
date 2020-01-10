//
//  RandomData.swift
//  Amusement
//
//  Created by Michael Flowers on 1/8/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

struct RandomData {
    static var childGuest: ChildGuest {
        return try! ChildGuest(dateOfBirth: Date().readableDateString())
    }
    
    static var adult: ClassicGuest {
        return try! ClassicGuest()
    }
    
    static var vip: VIPGuest {
        return try! VIPGuest()
    }
    
    static var seniorGuest: SeniorGuest {
        return try! SeniorGuest(firstName: "Test", lastName: "Senior", dateOfBirth: Date.distantPast.readableDateString())
    }
    
    static var seasonPassGuest: SeasonPassGuest {
        let info = try! PersonalInformation(firstName: "Test", lastName: "Season", streetAddress: "Some Street", cityName: "Some City", state: "Stateless", zipCode: "10001")
        return try! SeasonPassGuest(personalInformation: info, dateOfBirth: Date().readableDateString())
    }
    
    static var foodServicesEmployee: HourlyEmployeeFoodService {
        let info = try! PersonalInformation(firstName: "Test", lastName: "Employee", streetAddress: "Some Street", cityName: "Somewhere", state: "Stateless", zipCode: "10001")
        return try! HourlyEmployeeFoodService(employeeInformation: info, SSN: "93847953", dateOfBirth: Date().readableDateString())
    }
    
    static var rideServicesEmployee: HourlyEmployeeRideServices {
        let info = try! PersonalInformation(firstName: "Test", lastName: "Employee", streetAddress: "Some Street", cityName: "Somewhere", state: "Stateless", zipCode: "10001")
        return try! HourlyEmployeeRideServices(employeeInformation: info, SSN: "93847953", dateOfBirth: Date().readableDateString())
    }
    
    static var maintenanceEmployee: HourlyEmployeeMaintenance {
        let info = try! PersonalInformation(firstName: "Test", lastName: "Employee", streetAddress: "Some Street", cityName: "Somewhere", state: "Stateless", zipCode: "10001")
        return try! HourlyEmployeeMaintenance(employeeInformation: info, SSN: "93847953", dateOfBirth: Date().readableDateString())
    }
    
    static var vendor: Vendor {
        return try! Vendor(firstName: "Test", lastName: "Vendor", company: .acme, dateOfBirth: Date().readableDateString(), dateOfVisit: Date())
    }
    
    static var contractor: ContractEmployee {
        let info = try! PersonalInformation(firstName: "Test", lastName: "Contractor", streetAddress: "Some Street", cityName: "Some City", state: "Stateless", zipCode: "10001")
        return try! ContractEmployee(personalInformation: info, projectNumber: .oneThousandOne, SSN: "3245353", dateOfBirth: Date().readableDateString())
    }
    
    static func manager(tier: ManagerType) -> Manager {
        let info = try! PersonalInformation(firstName: "Test", lastName: "Manager", streetAddress: "Some Street", cityName: "Somewhere", state: "Stateless", zipCode: "10001")
        return try! Manager(employeeInformation: info, managerType: tier, SSN: "93847953", dateOfBirth: Date().readableDateString())
    }
}
