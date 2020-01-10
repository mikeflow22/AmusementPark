//
//  Date Extensions.swift
//  Amusement
//
//  Created by Dennis Parussini on 10.01.20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import Foundation

extension Date {
    func readableDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    static func fromString(_ string: String) -> Self? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        return dateFormatter.date(from: string)
    }
}
