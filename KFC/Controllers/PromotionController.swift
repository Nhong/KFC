//
//  PromotionController.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

class PromotionController {
    
    let promotionAPIManager: PromotionAPIManager
    
    init(promotionAPIManager: PromotionAPIManager = PromotionAPIManagerImplementation()) {
        self.promotionAPIManager = promotionAPIManager
        self.promotionAPIManager.setPromotionAPIManagerDelegate(self)
    }
    
    func getPromotion() {
        promotionAPIManager.getCurrentPromotion()
    }
    
}

extension PromotionController: PromotionAPIManagerDelegate {
    
    func didGetPromotionCompletion(promotion: Promotion) {
        print("Promotion is \(promotion.name), discount: \(promotion.discountPercent) %")
    }
    
    func didGetPromotionFailure(error: Error) {
        print(ErrorHelperImplementation.ErrorMessage(
            errorHelper: error as! ErrorHelper))
    }
    
}
