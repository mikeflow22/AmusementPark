//
//  PassViewController.swift
//  Amusement
//
//  Created by Dennis Parussini on 10.01.20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

final class PassViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var unlimitedRidesLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    @IBOutlet weak var testResultBackgroundView: UIView!
    @IBOutlet weak var testResultLabel: UILabel!
    
    var entrant: Entrant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entrant = entrant {
            if let firstName = entrant.personInformation?.firstName, let lastName = entrant.personInformation?.lastName {
                nameLabel.text = "\(firstName) \(lastName)"
            }
            
            passTypeLabel.text = entrant.passType.rawValue
            
            unlimitedRidesLabel.isHidden = !entrant.rideAccess.contains(.allRides)
            merchDiscountLabel.isHidden = !entrant.discountType.contains(.merchandiseDiscount)
            foodDiscountLabel.isHidden = !entrant.discountType.contains(.foodDiscount)
        }
    }
    
    @IBAction func areaAccessButtonTapped(_ sender: UIButton) {
        if let entrant = entrant, !entrant.areaAccess.isEmpty {
            let areas = entrant.areaAccess.map { $0.rawValue }.joined(separator: ", ")
            
            testResultBackgroundView.backgroundColor = .green
            testResultLabel.text = areas
        } else {
            testResultBackgroundView.backgroundColor = .red
            testResultLabel.text = "No Area Access"
        }
    }
    
    @IBAction func rideAccessButtonTapped(_ sender: UIButton) {
        if let entrant = entrant, !entrant.rideAccess.isEmpty {
            let rides = entrant.rideAccess.map { $0.rawValue }.joined(separator: ", ")
            
            testResultBackgroundView.backgroundColor = .green
            testResultLabel.text = rides
        } else {
            testResultBackgroundView.backgroundColor = .red
            testResultLabel.text = "No Ride Access"
        }
    }
    
    @IBAction func discountAccessButtonTapped(_ sender: Any) {
        if let entrant = entrant, !entrant.discountType.isEmpty {
            let discounts = entrant.discountType.map { $0.rawValue }.joined(separator: ", ")
            
            testResultBackgroundView.backgroundColor = .green
            testResultLabel.text = discounts
        } else {
            testResultBackgroundView.backgroundColor = .red
            testResultLabel.text = "No Discounts"
        }
    }
    
    @IBAction func createNewPassButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
