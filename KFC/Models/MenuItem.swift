//
//  Menu.swift
//  KFC
//
//  Created by Kittinun Chobtham on 14/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

enum MenuNumber: Int {
    case One = 0
    case Two
    case Three
}

class MenuItem {
    var name: String
    var price: Int
    var quantity: Int
    
    init(name: String,
         price: Int,
         quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
}
