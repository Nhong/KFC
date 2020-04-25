//
//  ShoppingCartAPIClient.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol ShoppingCartAPIClient {
    func addMenuItemToShoppingCart(menuItem: MenuItem,
                                   completion: @escaping (_ shoppingCart: ShoppingCart?, _ error: Error?) -> ())
}

final class ShoppingCartAPIClientImplementation: ShoppingCartAPIClient {
    
    func addMenuItemToShoppingCart(menuItem: MenuItem,
                                   completion: @escaping (ShoppingCart?, Error?) -> ()) {
        updateShoppingCartFromCurrentUser(menuItem: menuItem)
        
        completion(currentUser?.shoppingCart, nil)
    }
    
    private func updateShoppingCartFromCurrentUser(menuItem: MenuItem) {
        currentUser?.shoppingCart.addToShoppingCart(item: menuItem)
    }
    
}
