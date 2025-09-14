//
//  String+Ext.swift
//  AirbnbClone
//
//  Created by Divakar T R on 14/09/25.
//

import Foundation

extension String {
    
    var isValidEmail : Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicte = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicte.evaluate(with: self)
        
    }
    
}
