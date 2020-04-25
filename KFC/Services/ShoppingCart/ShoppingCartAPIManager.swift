//
//  ShoppingCartAPIManager.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol ShoppingCartAPIManager {
    func addMenuItemToShoppingCart(menuItem: MenuItem)
    func setShoppingCartAPIManagerDelegate(_ delegate: ShoppingCartAPIManagerDelegate)
}

protocol ShoppingCartAPIManagerDelegate {
    func didAddMenuToShoppingCartCompletion(shoppingCart: ShoppingCart)
    func didAddMenuShoppingCartFailure(error: Error)
}

final class ShoppingCartAPIManagerImplementation: ShoppingCartAPIManager {
    
    let apiClient: ShoppingCartAPIClient
    var delegate: ShoppingCartAPIManagerDelegate?
    
    init(apiClient: ShoppingCartAPIClient = ShoppingCartAPIClientImplementation()) {
        self.apiClient = apiClient
    }
    
    func setShoppingCartAPIManagerDelegate(_ delegate: ShoppingCartAPIManagerDelegate) {
        self.delegate = delegate
    }
    
    func addMenuItemToShoppingCart(menuItem: MenuItem) {
        apiClient.addMenuItemToShoppingCart(menuItem: menuItem) { (optionalShoppingCart, optionalError) in
            if let error = optionalError {
                self.delegate?.didAddMenuShoppingCartFailure(error: error)
                
                return
            }
            
            if let shoppingCart = optionalShoppingCart {
                self.delegate?.didAddMenuToShoppingCartCompletion(shoppingCart: shoppingCart)
            }
        }
    }
    
}
