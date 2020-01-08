//
//  HomePageTableViewController.swift
//  Amusement
//
//  Created by Michael Flowers on 1/8/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

class HomePageTableViewController: UITableViewController {

    //MARK: - Properties
    var selectedEntrants: Entrant? =  RandomData.childGuest
    
    
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
    
    //MARK: - IBActions
    
    @IBAction func guestButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func employeeButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func mangerButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func vendorButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func childButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func adultButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func seniorButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func vipButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func generatePassButtonTapped(_ sender: UIButton) {
        //get data from user
        do {
            let personalInfo = try PersonalInformation(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, cityName: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text)
            let manager = try Manager(employeeInformation: personalInfo)
            print("Printing out manager's information: \(manager)")
        } catch  {
            print("Error in: \(#function)\n Readable Error: \(error.localizedDescription)\n Technical Error: \(error)")
        }
    }
    
    @IBAction func populateDataButtonTapped(_ sender: UIButton) {
        switch selectedEntrants {
        case is ChildGuest:
            dateOfBirthTextField.text = RandomData.childGuest.dateOfBirth?.description
        default:
            break
        }
    }
}
