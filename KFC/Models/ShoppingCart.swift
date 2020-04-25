//
//  ShoppingCart.swift
//  KFC
//
//  Created by Kittinun Chobtham on 14/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

class ShoppingCart {
    var menuItems: [MenuItem] = []
    
    func addToShoppingCart(item: MenuItem) {
        menuItems.append(item)
    }
    
    func totalConst() -> Int {
        var summary: Int = 0
        
        menuItems.forEach{ summary = summary + ($0.price * $0.quantity) }
        
        return summary
    }
    
}
