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
    @IBOutlet weak var contractorButton: UIButton!
    @IBOutlet var textFields: [UITextField]!
    
    
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
            childButton.setTitle("Acme", for: UIControl.State())
            adultButton.setTitle("Orkin", for: UIControl.State())
            seniorButton.setTitle("Fedex", for: UIControl.State())
            vipButton.isHidden = false
            vipButton.setTitle("NW Electrical", for: UIControl.State())
            vendor2002Button.isHidden = true
        case .contractor:
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
        textFields.forEach { $0.text = "" }
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
            dateOfBirthTextField.isEnabled = true
            companyTextField.isEnabled = false
            zipCodeTextField.isEnabled = true
            stateTextField.isEnabled = true
            cityTextField.isEnabled = true
            projectNumberTextField.isEnabled = false
            SSNTextField.isEnabled = true
        case .contractor:
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            dateOfBirthTextField.isEnabled = true
            companyTextField.isEnabled = false
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
            streetAddressTextField.isEnabled = false
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
            companyTextField.text = "Acme"
        case .contractor:
            selectedEntrant = .contractor
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
            companyTextField.text = "Orkin"
            case .contractor:
            selectedEntrant = .contractor
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
            companyTextField.text = "Fedex"
            case .contractor:
            selectedEntrant = .contractor
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
            companyTextField.text = "NW Electrical"
            case .contractor:
            selectedEntrant = .contractor
            projectNumberTextField.text = "2001"
        default: break
        }
    }
    
    @IBAction func vendor2002ButtonTapped(_ sender: UIButton) {
        switch selectedEntrantType {
        case .guest: selectedEntrant = .senior
            case .contractor:
            selectedEntrant = .contractor
            projectNumberTextField.text = "2002"
        default: break
        }
    }
    
    @IBAction func contractorButtonTapped(_ sender: UIButton) {
        selectedEntrantType = .contractor
    }
    
    @IBAction func generatePassButtonTapped(_ sender: UIButton) {
        var entrant: Entrant?
        
        do {
            guard let selectedEntrant = selectedEntrant else { return }
            
            switch selectedEntrant {
            case .adult: entrant = try ClassicGuest()
            case .vip: entrant = try VIPGuest()
            case .child: entrant = try ChildGuest(dateOfBirth: dateOfBirthTextField.text)
            case .season: entrant = try SeasonPassGuest(personalInformation: PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), dateOfBirth: dateOfBirthTextField.text)
            case .senior: entrant = try SeniorGuest(firstName: firstNameTextField.text, lastName: lastNameTextField.text, dateOfBirth: dateOfBirthTextField.text)
            case .contractor:
                guard let projectNumberString = projectNumberTextField.text, let projectNumberInt = Int(projectNumberString), let projectNumber = ContractEmployee.ProjectNumber(rawValue: projectNumberInt) else { return }
                
                entrant = try ContractEmployee(personalInformation: PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), projectNumber: projectNumber, SSN: SSNTextField.text, dateOfBirth: dateOfBirthTextField.text)
            case .vendor:
                guard let companyString = companyTextField.text, let company = Vendor.VendorCompany(rawValue: companyString) else { return }
                
                try entrant = Vendor(firstName: firstNameTextField.text, lastName: lastNameTextField.text, company: company, dateOfBirth: dateOfBirthTextField.text, dateOfVisit: Date())
            case .foodServiceEmployee: entrant = try HourlyEmployeeFoodService(employeeInformation: PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), SSN: SSNTextField.text, dateOfBirth: dateOfBirthTextField.text)
            case .maintenanceEmployee: entrant = try HourlyEmployeeMaintenance(employeeInformation: PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), SSN: SSNTextField.text, dateOfBirth: dateOfBirthTextField.text)
            case .rideServiceEmployee: entrant = try HourlyEmployeeRideServices(employeeInformation: PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), SSN: SSNTextField.text, dateOfBirth: dateOfBirthTextField.text)
            case .seniorManager: entrant = try Manager(employeeInformation: PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), managerType: .seniorManager, SSN: SSNTextField.text, dateOfBirth: dateOfBirthTextField.text)
            case .generalManager: entrant = try Manager(employeeInformation: PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), managerType: .generalManager, SSN: SSNTextField.text, dateOfBirth: dateOfBirthTextField.text)
            case .shiftManager: entrant = try Manager(employeeInformation: PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text), managerType: .shiftManager, SSN: SSNTextField.text, dateOfBirth: dateOfBirthTextField.text)
            }
        } catch {
            presentAlert(with: "Error", message: error.localizedDescription)
        }
        
        if let entrant = entrant {
            guard let passVC = storyboard?.instantiateViewController(withIdentifier: "PassViewController") as? PassViewController else { return }
            passVC.entrant = entrant
            present(passVC, animated: true)
        }
    }
    
    @IBAction func populateDataButtonTapped(_ sender: UIButton) {
        switch selectedEntrant {
        case .child: dateOfBirthTextField.text = RandomData.childGuest.dateOfBirth.readableDateString()
        case .senior:
            firstNameTextField.text = RandomData.seniorGuest.firstName
            lastNameTextField.text = RandomData.seniorGuest.lastName
            dateOfBirthTextField.text = RandomData.seniorGuest.dateOfBirth.readableDateString()
        case .season:
            let guestInfo = RandomData.seasonPassGuest.personInformation
            firstNameTextField.text = guestInfo?.firstName
            lastNameTextField.text = guestInfo?.lastName
            streetAddressTextField.text = guestInfo?.streetAddress
            stateTextField.text = guestInfo?.state
            zipCodeTextField.text = guestInfo?.zipCode
            dateOfBirthTextField.text = RandomData.seasonPassGuest.dateOfBirth.readableDateString()
        case .contractor:
            let employeeInfo = RandomData.contractor.personInformation
            firstNameTextField.text = employeeInfo?.firstName
            lastNameTextField.text = employeeInfo?.lastName
            streetAddressTextField.text = employeeInfo?.streetAddress
            zipCodeTextField.text = employeeInfo?.zipCode
            stateTextField.text = employeeInfo?.state
            SSNTextField.text = RandomData.contractor.SSN
            cityTextField.text = employeeInfo?.cityName
            dateOfBirthTextField.text = RandomData.contractor.dateOfBirth.readableDateString()
            projectNumberTextField.text = "\(RandomData.contractor.projectNumber.rawValue)"
        case .vendor:
            let employeeInfo = RandomData.vendor
            firstNameTextField.text = employeeInfo.firstName
            lastNameTextField.text = employeeInfo.lastName
            companyTextField.text = RandomData.vendor.company.rawValue
            dateOfBirthTextField.text = RandomData.vendor.dateOfBirth.readableDateString()
        case .foodServiceEmployee:
            let employeeInfo = RandomData.foodServicesEmployee.personInformation
            firstNameTextField.text = employeeInfo?.firstName
            lastNameTextField.text = employeeInfo?.lastName
            streetAddressTextField.text = employeeInfo?.streetAddress
            zipCodeTextField.text = employeeInfo?.zipCode
            cityTextField.text = employeeInfo?.cityName
            stateTextField.text = employeeInfo?.state
            SSNTextField.text = RandomData.foodServicesEmployee.SSN
            dateOfBirthTextField.text = RandomData.foodServicesEmployee.dateOfBirth.readableDateString()
        case .maintenanceEmployee:
            let employeeInfo = RandomData.maintenanceEmployee.personInformation
            firstNameTextField.text = employeeInfo?.firstName
            lastNameTextField.text = employeeInfo?.lastName
            streetAddressTextField.text = employeeInfo?.streetAddress
            zipCodeTextField.text = employeeInfo?.zipCode
            stateTextField.text = employeeInfo?.state
            cityTextField.text = employeeInfo?.cityName
            SSNTextField.text = RandomData.maintenanceEmployee.SSN
            dateOfBirthTextField.text = RandomData.maintenanceEmployee.dateOfBirth.readableDateString()
        case .rideServiceEmployee:
            let employeeInfo = RandomData.rideServicesEmployee.personInformation
            firstNameTextField.text = employeeInfo?.firstName
            lastNameTextField.text = employeeInfo?.lastName
            streetAddressTextField.text = employeeInfo?.streetAddress
            zipCodeTextField.text = employeeInfo?.zipCode
            stateTextField.text = employeeInfo?.state
            cityTextField.text = employeeInfo?.cityName
            SSNTextField.text = RandomData.rideServicesEmployee.SSN
            dateOfBirthTextField.text = RandomData.rideServicesEmployee.dateOfBirth.readableDateString()
        case .shiftManager:
            let managerInfo = RandomData.manager(tier: .shiftManager).personInformation
            firstNameTextField.text = managerInfo?.firstName
            lastNameTextField.text = managerInfo?.lastName
            streetAddressTextField.text = managerInfo?.streetAddress
            zipCodeTextField.text = managerInfo?.zipCode
            stateTextField.text = managerInfo?.state
            cityTextField.text = managerInfo?.cityName
            SSNTextField.text = RandomData.manager(tier: .shiftManager).SSN
            dateOfBirthTextField.text = RandomData.manager(tier: .shiftManager).dateOfBirth.readableDateString()
        case .generalManager:
            let managerInfo = RandomData.manager(tier: .generalManager).personInformation
            firstNameTextField.text = managerInfo?.firstName
            lastNameTextField.text = managerInfo?.lastName
            streetAddressTextField.text = managerInfo?.streetAddress
            zipCodeTextField.text = managerInfo?.zipCode
            stateTextField.text = managerInfo?.state
            cityTextField.text = managerInfo?.cityName
            SSNTextField.text = RandomData.manager(tier: .generalManager).SSN
            dateOfBirthTextField.text = RandomData.manager(tier: .generalManager).dateOfBirth.readableDateString()
        case .seniorManager:
            let managerInfo = RandomData.manager(tier: .seniorManager).personInformation
            firstNameTextField.text = managerInfo?.firstName
            lastNameTextField.text = managerInfo?.lastName
            streetAddressTextField.text = managerInfo?.streetAddress
            zipCodeTextField.text = managerInfo?.zipCode
            cityTextField.text = managerInfo?.cityName
            stateTextField.text = managerInfo?.state
            SSNTextField.text = RandomData.manager(tier: .seniorManager).SSN
            dateOfBirthTextField.text = RandomData.manager(tier: .seniorManager).dateOfBirth.readableDateString()
        default: break
        }
    }
}
