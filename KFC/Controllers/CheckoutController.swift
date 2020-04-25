//
//  CheckoutController.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

class CheckoutController {
   
    let checkoutAPIManager: CheckoutAPIManager
    
    init(checkoutAPIManager: CheckoutAPIManager = CheckoutAPIManagerImplementation()) {
        self.checkoutAPIManager = checkoutAPIManager
        
        self.checkoutAPIManager.setCheckoutAPIManagerDelegate(self)
    }
    
    func addItemsToCheckout(items: [MenuItem],
                            shipping: Shipping,
                            promotions: [Promotion]?) {
        checkoutAPIManager.checkout(menuItems: items,
                                    shipping: shipping,
                                    promotions: promotions)
    }
    
}

extension CheckoutController: CheckoutAPIManagerDelegate {
    
    func didCheckoutCompletion(checkout: Checkout) {
        print("")
        print("Check out is: \n")
        checkout.menuItems.forEach{ print($0.name)}
        print("")
        print("Total cost is: \(checkout.totalCost())")
    }
    
    func didCheckoutFailure(error: Error) {
        print(ErrorHelperImplementation.ErrorMessage(
            errorHelper: error as! ErrorHelper))
    }
    
}
