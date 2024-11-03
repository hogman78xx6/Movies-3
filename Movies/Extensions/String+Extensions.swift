//
//  String+Extensions.swift
//  Movies
//
//  Created by Mohammad Azam on 6/6/23.
//  Updated by Michael Knych to work with Xcode 16.1 and Swift 5
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
}
