//
//  NumberFormatter+Extensions.swift
//  Movies
//
//  Created by Mohammad Azam on 6/7/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import Foundation

extension NumberFormatter {
    
    static var year: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = false
        return formatter 
    }
    
}
