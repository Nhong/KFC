//
//  CheckoutAPIManager.swift
//  KFC
//
//  Created by Kittinun Chobtham on 22/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol CheckoutAPIManager {
    func checkout(menuItems: [MenuItem],
                  shipping: Shipping,
                  promotions: [Promotion]?)
    func setCheckoutAPIManagerDelegate(_ delegate: CheckoutAPIManagerDelegate?)
}

protocol CheckoutAPIManagerDelegate {
    func didCheckoutCompletion(checkout: Checkout)
    func didCheckoutFailure(error: Error)
}

final class CheckoutAPIManagerImplementation: CheckoutAPIManager {
    
    let apiClient: CheckoutAPIClient
    var delegate: CheckoutAPIManagerDelegate?
    
    init(apiClient: CheckoutAPIClient = CheckoutAPIClientImplementation()) {
        self.apiClient = apiClient
    }
    
    func setCheckoutAPIManagerDelegate(_ delegate: CheckoutAPIManagerDelegate?) {
        self.delegate = delegate
    }
    
    func checkout(menuItems: [MenuItem],
                  shipping: Shipping,
                  promotions: [Promotion]?) {
        apiClient.checkout(menuItems: menuItems,
                           shipping: shipping,
                           promotions: promotions)
        { (optionalCheckout, optionalError) in
            if let error = optionalError {
                self.delegate?.didCheckoutFailure(error: error)
                return
            }
            
            if let checkout = optionalCheckout {
                self.delegate?.didCheckoutCompletion(checkout: checkout)
            }
        }
    }
    
}
