//
//  Checkout.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

class Checkout {
    var menuItems: [MenuItem]
    var promotion: [Promotion]?
    var shipping: Shipping
    
    init(menuItems: [MenuItem],
         promotion: [Promotion]?,
         shipping: Shipping) {
        self.menuItems = menuItems
        self.promotion = promotion
        self.shipping = shipping
    }
    
    func totalCost() -> Float {
        var summary: Float = 0.0
        
        menuItems.forEach{ summary = summary + Float($0.price * $0.quantity) }
        
        summary = Float(summary) - totalDiscount()
        summary = summary + Float(shipping.cost)
        
        return summary
    }
    
    private func totalDiscount() -> Float {
        var totalDiscount: Float = 0.0
        
        menuItems.enumerated().forEach { (item) in
            if item.offset == MenuNumber.One.rawValue {
                let discount = ((Float(item.element.price) * Float(promotion![item.offset].discountPercent)) / 100.0)
                
                totalDiscount = totalDiscount + ( discount * Float(promotion!.count))
                
                promotion?.remove(at: item.offset)
            }
        }
        
        return totalDiscount
    }
    
}
