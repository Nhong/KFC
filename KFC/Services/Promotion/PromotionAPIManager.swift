//
//  PromotionAPIManager.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol PromotionAPIManager {
    func getCurrentPromotion()
    func setPromotionAPIManagerDelegate(_ delegate: PromotionAPIManagerDelegate)
}

protocol PromotionAPIManagerDelegate {
    func didGetPromotionCompletion(promotion: Promotion)
    func didGetPromotionFailure(error: Error)
}

final class PromotionAPIManagerImplementation: PromotionAPIManager {
    
    let apiClient: PromotionAPIClient
    var delegate: PromotionAPIManagerDelegate?
    
    init(apiClient: PromotionAPIClient = PromotionAPIClientImplementation()) {
        self.apiClient = apiClient
    }
    
    func setPromotionAPIManagerDelegate(_ delegate: PromotionAPIManagerDelegate) {
        self.delegate = delegate
    }
    
    func getCurrentPromotion() {
        apiClient.getCurrentPromotion { (optionalPromotion, optionalError) in
            if let error = optionalError {
                self.delegate?.didGetPromotionFailure(error: error)
                
                return
            }
            
            if let promotion = optionalPromotion {
                self.delegate?.didGetPromotionCompletion(promotion: promotion)
            }
        }
    }
    
}
