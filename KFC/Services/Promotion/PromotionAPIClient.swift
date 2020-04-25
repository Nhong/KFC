//
//  PromotionAPIClient.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol PromotionAPIClient {
    func getCurrentPromotion(completion: @escaping  (_ promotion: Promotion?, _ error: Error?) -> ())
}

final class PromotionAPIClientImplementation: PromotionAPIClient {
    
    func getCurrentPromotion(completion: @escaping  (_ promotion: Promotion?, _ error: Error?) -> ()) {
        let newPromotion: Promotion? = Promotion(name: "สุข X 3",
                                                 discountPercent: 10)
        currentPromotion = newPromotion
        
        completion(newPromotion, nil)
    }
    
}
