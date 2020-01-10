//
//  UIViewController+UIAlertController.swift
//  Amusement
//
//  Created by Dennis Parussini on 10.01.20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
