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
        return try! ChildGuest(dateOfBirth: Date())
    }
    
    static var foodServicesEmployee: HourlyEmployeeFoodService {
        let info = try! PersonalInformation(firstName: "Test", lastName: "Employee", streetAddress: "Some Street", cityName: "Somewhere", state: "Stateless", zipCode: "10001")
        return try! HourlyEmployeeFoodService(employeeInformation: info, SSN: "93847953", dateOfBirth: Date())
    }
    
    static var manager: Manager {
        let info = try! PersonalInformation(firstName: "Test", lastName: "Manager", streetAddress: "Some Street", cityName: "Somewhere", state: "Stateless", zipCode: "10001")
        return try! Manager(employeeInformation: info, managerType: .generalManager, SSN: "93847953", dateOfBirth: Date())
    }
    
    
    
}
