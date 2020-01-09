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
        case adult, child, vip, senior, foodServiceEmployee, maintenanceEmployee, rideServiceEmployee, manager
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
    @IBOutlet weak var childButtonProperties: UIButton!
    @IBOutlet weak var adultButtonProperties: UIButton!
    @IBOutlet weak var seniorButtonProperties: UIButton!
    @IBOutlet weak var vipButtonProperties: UIButton!
    
    //We can use this functio to change the button titles of the bottom selection row.
    func adjustBottomSelection() {
        //An example implementation
        switch selectedEntrantType {
        case .guest:
            childButtonProperties.setTitle("Child", for: UIControl.State())
            adultButtonProperties.setTitle("Adult", for: UIControl.State())
            seniorButtonProperties.setTitle("Senior", for: UIControl.State())
            vipButtonProperties.setTitle("VIP", for: UIControl.State())
        case .manager:
            childButtonProperties.setTitle("Manager type 1", for: UIControl.State())
            adultButtonProperties.setTitle("Manager type 2", for: UIControl.State())
        case .hourlyEmployee:
            childButtonProperties.setTitle("Employee type 1", for: UIControl.State())
            adultButtonProperties.setTitle("Employee type 2", for: UIControl.State())
        default: break
        }
    }
    
    //If I remember correctly you need to enable/disable text fields depending on the user's selection, here's an example implementation of a function that handles this
    func updateTextFields(for entrantSubType: EntrantSubType) {
        switch entrantSubType {
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
        default: break
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
    }
    
    //Second row button actions
    @IBAction func childButtonTapped(_ sender: UIButton) {
        //Here's where things start to get a little more complicated. You need to check the selected entrant type of the top row and then link that to the selected entrant sub type from the bottom row, then let the variable know which type it stores.
        
        switch selectedEntrantType {
        case .guest: selectedEntrant = .child
        default: break
        }
    }
    
    @IBAction func adultButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func seniorButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func vipButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func generatePassButtonTapped(_ sender: UIButton) {
        //Again you need to switch over the user's selection to create the correct entrant sub type with the data you get from the user
        
        //get data from user
        switch selectedEntrant {
        case .manager:
            do {
                let personalInfo = try PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text)
                let manager = try Manager(employeeInformation: personalInfo)
                print("Printing out manager's information: \(manager)")
            } catch  {
                print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
            }
            
        default: break
        }
    }
    
    @IBAction func populateDataButtonTapped(_ sender: UIButton) {
        switch selectedEntrant {
        case .child:
            dateOfBirthTextField.text = RandomData.childGuest.dateOfBirth.description
        default:
            break
        }
    }
}
