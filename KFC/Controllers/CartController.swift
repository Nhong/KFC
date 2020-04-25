//
//  CartController.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

final class CartController {
    
    let cartAPIManager: ShoppingCartAPIManager
    
    init(cartAPIManager: ShoppingCartAPIManager = ShoppingCartAPIManagerImplementation()) {
        self.cartAPIManager = cartAPIManager
        self.cartAPIManager.setShoppingCartAPIManagerDelegate(self)
    }
    
    func addMenuItemToShoppingCart(menuItem: MenuItem) {
        cartAPIManager.addMenuItemToShoppingCart(menuItem: menuItem)
    }
    
}

extension CartController: ShoppingCartAPIManagerDelegate {
    
    func didAddMenuShoppingCartFailure(error: Error) {
        print(ErrorHelperImplementation.ErrorMessage(
                 errorHelper: error as! ErrorHelper))
    }
    
    func didAddMenuToShoppingCartCompletion(shoppingCart: ShoppingCart) {
        print("")
        print("Cart is: ")
        shoppingCart.menuItems.forEach{ print($0.name)}
    }
    
}
