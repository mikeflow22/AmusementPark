//
//  HomePageTableViewController.swift
//  Amusement
//
//  Created by Michael Flowers on 1/8/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

class HomePageTableViewController: UITableViewController {
    
    //A small helper enum that enables us to switch over the different entrant sub types and simplifies the selection of a concrete type.
    enum EntrantSubType {
        case adult, child, vip, senior, season, foodServiceEmployee, maintenanceEmployee, rideServiceEmployee, seniorManager, generalManager, shiftManager, contractor, vendor
    }
    
    //MARK: - Properties
    //We can use this variable to track the selection for the top row, then adjust the button titles in the second row according to it. The didSet is used to trigger the updating of the buttons as soon as the user taps a button in the top row.
    var selectedEntrantType: EntrantType? {
        didSet {
            adjustBottomSelection()
        }
    }
    
    var selectedEntrant: EntrantSubType? {
        didSet {
            updateTextFields(for: selectedEntrant!)
        }
    }
    
   //MARK: - IBOutlets
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var SSNTextField: UITextField!
    @IBOutlet weak var projectNumberTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var adultButton: UIButton!
    @IBOutlet weak var seniorButton: UIButton!
    @IBOutlet weak var vipButton: UIButton!
    @IBOutlet weak var vendor2002Button: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //We're using this here to make sure the buttons are set up correctly when the view gets on-screen.
        selectedEntrantType = .guest
        adjustBottomSelection()
    }
    
    //We can use this functio to change the button titles of the bottom selection row.
    func adjustBottomSelection() {
        //An example implementation
        switch selectedEntrantType {
        case .guest:
            childButton.setTitle("Child", for: UIControl.State())
            adultButton.setTitle("Adult", for: UIControl.State())
            seniorButton.setTitle("Senior", for: UIControl.State())
            vipButton.isHidden = false
            vipButton.setTitle("VIP", for: UIControl.State())
            vendor2002Button.isHidden = false
            vendor2002Button.setTitle("Season Pass", for: UIControl.State())
        case .manager:
            childButton.setTitle("Shift Manager", for: UIControl.State())
            adultButton.setTitle("General Manager", for: UIControl.State())
            seniorButton.setTitle("Senior Manager", for: UIControl.State())
            vipButton.isHidden = true
            vendor2002Button.isHidden = true
        case .hourlyEmployee:
            childButton.setTitle("Food Services", for: UIControl.State())
            adultButton.setTitle("Ride Services", for: UIControl.State())
            seniorButton.setTitle("Maintenance", for: UIControl.State())
            vipButton.isHidden = false
            vipButton.setTitle("Contractor", for: UIControl.State())
            vendor2002Button.isHidden = true
        case .vendor:
            childButton.setTitle("1001", for: UIControl.State())
            adultButton.setTitle("1002", for: UIControl.State())
            seniorButton.setTitle("1003", for: UIControl.State())
            vipButton.isHidden = false
            vipButton.setTitle("2001", for: UIControl.State())
            vendor2002Button.isHidden = false
            vendor2002Button.setTitle("2002", for: UIControl.State())
        default: break
        }
    }
    
    //If I remember correctly you need to enable/disable text fields depending on the user's selection, here's an example implementation of a function that handles this
    func updateTextFields(for entrantSubType: EntrantSubType) {
        switch entrantSubType {
        case .adult:
            firstNameTextField.isEnabled = false
            lastNameTextField.isEnabled = false
            dateOfBirthTextField.isEnabled = false
            companyTextField.isEnabled = false
            zipCodeTextField.isEnabled = false
            stateTextField.isEnabled = false
            cityTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            SSNTextField.isEnabled = false
        case .vip:
            firstNameTextField.isEnabled = false
            lastNameTextField.isEnabled = false
            dateOfBirthTextField.isEnabled = false
            companyTextField.isEnabled = false
            zipCodeTextField.isEnabled = false
            stateTextField.isEnabled = false
            cityTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            SSNTextField.isEnabled = false
        case .child:
            firstNameTextField.isEnabled = false
            lastNameTextField.isEnabled = false
            dateOfBirthTextField.isEnabled = true
            companyTextField.isEnabled = false
            zipCodeTextField.isEnabled = false
            stateTextField.isEnabled = false
            cityTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            SSNTextField.isEnabled = false
        case .season:
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            dateOfBirthTextField.isEnabled = false
            companyTextField.isEnabled = false
            zipCodeTextField.isEnabled = true
            stateTextField.isEnabled = true
            cityTextField.isEnabled = true
            projectNumberTextField.isEnabled = false
            SSNTextField.isEnabled = false
        case .senior:
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            dateOfBirthTextField.isEnabled = true
            companyTextField.isEnabled = false
            zipCodeTextField.isEnabled = false
            stateTextField.isEnabled = false
            cityTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            SSNTextField.isEnabled = false
        case .foodServiceEmployee, .maintenanceEmployee, .rideServiceEmployee:
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            dateOfBirthTextField.isEnabled = false
            companyTextField.isEnabled = false
            zipCodeTextField.isEnabled = true
            stateTextField.isEnabled = true
            cityTextField.isEnabled = true
            projectNumberTextField.isEnabled = false
            SSNTextField.isEnabled = true
        case .contractor:
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            dateOfBirthTextField.isEnabled = false
            companyTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            stateTextField.isEnabled = true
            cityTextField.isEnabled = true
            projectNumberTextField.isEnabled = true
            SSNTextField.isEnabled = true
        case .shiftManager, .generalManager, .seniorManager:
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            dateOfBirthTextField.isEnabled = true
            companyTextField.isEnabled = false
            zipCodeTextField.isEnabled = true
            stateTextField.isEnabled = true
            cityTextField.isEnabled = true
            projectNumberTextField.isEnabled = false
            SSNTextField.isEnabled = true
        case .vendor:
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            dateOfBirthTextField.isEnabled = true
            companyTextField.isEnabled = true
            zipCodeTextField.isEnabled = false
            stateTextField.isEnabled = false
            cityTextField.isEnabled = false
            projectNumberTextField.isEnabled = false
            SSNTextField.isEnabled = false
        }
    }
    
    //MARK: - IBActions
    //First row button actions
    @IBAction func guestButtonTapped(_ sender: UIButton) {
        selectedEntrantType = .guest
    }
    
    @IBAction func employeeButtonTapped(_ sender: UIButton) {
        selectedEntrantType = .hourlyEmployee
    }
    
    @IBAction func mangerButtonTapped(_ sender: UIButton) {
        selectedEntrantType = .manager
    }
    
    @IBAction func vendorButtonTapped(_ sender: UIButton) {
        selectedEntrantType = .vendor
    }
    
    //Second row button actions
    @IBAction func childButtonTapped(_ sender: UIButton) {
        //Here's where things start to get a little more complicated. You need to check the selected entrant type of the top row and then link that to the selected entrant sub type from the bottom row, then let the variable know which type it stores.
        
        switch selectedEntrantType {
        case .guest: selectedEntrant = .child
        case .hourlyEmployee: selectedEntrant = .foodServiceEmployee
        case .manager: selectedEntrant = .shiftManager
        case .vendor:
            selectedEntrant = .vendor
            projectNumberTextField.text = "1001"
        default: break
        }
    }
    
    @IBAction func adultButtonTapped(_ sender: UIButton) {
        switch selectedEntrantType {
        case .guest: selectedEntrant = .adult
        case .hourlyEmployee: selectedEntrant = .rideServiceEmployee
        case .manager: selectedEntrant = .generalManager
        case .vendor:
            selectedEntrant = .vendor
            projectNumberTextField.text = "1002"
        default: break
        }
    }
    
    @IBAction func seniorButtonTapped(_ sender: UIButton) {
        switch selectedEntrantType {
        case .guest: selectedEntrant = .senior
        case .hourlyEmployee: selectedEntrant = .maintenanceEmployee
        case .manager: selectedEntrant = .seniorManager
        case .vendor:
            selectedEntrant = .vendor
            projectNumberTextField.text = "1003"
        default: break
        }
    }
    
    @IBAction func vipButtonTapped(_ sender: UIButton) {
        switch selectedEntrantType {
        case .guest: selectedEntrant = .vip
        case .hourlyEmployee: selectedEntrant = .contractor
        case .vendor:
            selectedEntrant = .vendor
            projectNumberTextField.text = "2001"
        default: break
        }
    }
    
    @IBAction func vendor2002ButtonTapped(_ sender: UIButton) {
        switch selectedEntrantType {
        case .guest: selectedEntrant = .senior
        case .vendor:
            selectedEntrant = .vendor
            projectNumberTextField.text = "2002"
        default: break
        }
    }
    
    @IBAction func generatePassButtonTapped(_ sender: UIButton) {
        //Again you need to switch over the user's selection to create the correct entrant sub type with the data you get from the user
        
        //get data from user
//        switch selectedEntrant {
//        case .generalManager:
//            do {
//                let personalInfo = try PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text)
//                let manager = try Manager(employeeInformation: personalInfo, managerType: .generalManager)
//                print("Printing out manager's information: \(manager)")
//            } catch  {
//                print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
//            }
//
//        default: break
//        }
    }
    
    @IBAction func populateDataButtonTapped(_ sender: UIButton) {
        switch selectedEntrant {
        case .child: dateOfBirthTextField.text = RandomData.childGuest.dateOfBirth.description
        case .foodServiceEmployee, .maintenanceEmployee, .rideServiceEmployee:
            let employeeInfo = RandomData.foodServicesEmployee.personInformation
            firstNameTextField.text = employeeInfo?.firstName
            lastNameTextField.text = employeeInfo?.lastName
            streetAddressTextField.text = employeeInfo?.streetAddress
            zipCodeTextField.text = employeeInfo?.zipCode
            stateTextField.text = employeeInfo?.state
            SSNTextField.text = RandomData.foodServicesEmployee.SSN
            dateOfBirthTextField.text = RandomData.foodServicesEmployee.dateOfBirth.description
        case .shiftManager, .seniorManager, .generalManager:
            let managerInfo = RandomData.manager.personInformation
            firstNameTextField.text = managerInfo?.firstName
            lastNameTextField.text = managerInfo?.lastName
            streetAddressTextField.text = managerInfo?.streetAddress
            zipCodeTextField.text = managerInfo?.zipCode
            stateTextField.text = managerInfo?.state
            SSNTextField.text = RandomData.manager.SSN
            dateOfBirthTextField.text = RandomData.manager.dateOfBirth.description
        default: break
        }
    }
}
