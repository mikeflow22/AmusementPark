//
//  TestCases.swift
//  Amusement
//
//  Created by Michael Flowers on 9/26/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

enum TestStructType {
    case areaAccess
    case rideAccess
    case discount
}

struct TestStruct {
    var classicGuest: ClassicGuest?
    var vipGuest: VIPGuest?
    var childGuest: ChildGuest?
    var foodEmployee: HourlyEmployeeFoodService?
    var rideServiceEmployee: HourlyEmployeeRideServices?
    var maintenanceEmployee: HourlyEmployeeMaintenance?
    var manager: Manager?

    
    mutating func checkEmployeeInformation() {
        do {
            foodEmployee = try HourlyEmployeeFoodService(employeeInformation: PersonalInformation(firstName: nil, lastName: "help", streetAddress: "aaa", cityName: "aaa", state: "aaa", zipCode: "aaa"))
            
            rideServiceEmployee  = try HourlyEmployeeRideServices(employeeInformation: PersonalInformation(firstName: "a", lastName: "b", streetAddress: "c", cityName: "d", state: "3", zipCode: "f"))
            
            maintenanceEmployee = try HourlyEmployeeMaintenance(employeeInformation: PersonalInformation(firstName: "first", lastName: "last", streetAddress: nil, cityName: "city", state: "street", zipCode: "zippy"))
            
            manager = try Manager(employeeInformation: PersonalInformation(firstName: "first", lastName: "last", streetAddress: "address", cityName: "city", state: "state", zipCode: nil))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    mutating func testAreaAccess(accessArea: [AreaAccess]) throws {
        do {
            vipGuest = try VIPGuest()
           childGuest = try ChildGuest(dateOfBirth: Date())
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    
    mutating func checkGuest(){
        do {
            classicGuest =  try ClassicGuest()
            vipGuest = try  VIPGuest()
            childGuest = try ChildGuest(dateOfBirth: Date().addingTimeInterval(-444000))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //need to test for rideAccess, areaAccess, discount type, and swipe
    func rideAccessPermitted(for entrant: Entrant) -> Bool {
        return entrant.rideAccess.contains(.allRides)
    }
    
}
