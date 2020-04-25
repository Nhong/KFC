//
//  CheckoutAPIClient.swift
//  KFC
//
//  Created by Kittinun Chobtham on 22/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol CheckoutAPIClient {
    func checkout(menuItems: [MenuItem],
                  shipping: Shipping,
                  promotions: [Promotion]?,
                  completion: @escaping (_ checkout: Checkout?, _ error: Error?) -> ())
}

final class CheckoutAPIClientImplementation: CheckoutAPIClient {
    
    func checkout(menuItems: [MenuItem],
                  shipping: Shipping,
                  promotions: [Promotion]?,
                  completion: @escaping (_ checkout: Checkout?, _ error: Error?) -> ()) {
        let checkout = Checkout(menuItems: menuItems,
                                promotion: promotions,
                                shipping: shipping)
        
        currentUser?.checkout = checkout
        
        completion(checkout, nil)
    }
    
}
