//
//  User.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

class User {
    var name: String
    var surname: String
    var address: String
    var telephoneNumber: String
    var email: String
    var password: String
    var shoppingCart: ShoppingCart = ShoppingCart()
    var shipping: Shipping?
    var checkout: Checkout?
    
    init(name: String,
         surname: String,
         address: String,
         telephoneNumber: String,
         email: String,
         password: String) {
        self.name = name
        self.surname = surname
        self.address = address
        self.telephoneNumber = telephoneNumber
        self.email = email
        self.password = password
    }
    
}
