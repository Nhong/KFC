//
//  Promotion.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

class Promotion {
    var name: String
    var discountPercent: Int
    
    init(name: String,
         discountPercent: Int) {
        self.name = name
        self.discountPercent = discountPercent
    }
    
    func isValid(menuItems: [MenuItem]) -> Bool {
        let hasMenuOne = menuItems[MenuNumber.One.rawValue].quantity >= 1
        let hasMenuTwo = menuItems[MenuNumber.Two.rawValue].quantity >= 1
        let hasMenuThree = menuItems[MenuNumber.Three.rawValue].quantity >= 1
        
        return hasMenuOne && hasMenuTwo && hasMenuThree
    }
    
}
