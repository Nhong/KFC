//
//  Menu.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol MenuAPIManager {
    func getMenuItems()
    func setMenuItemsDelegate(_ delegate: MenuAPIManagerDelegate)
}

protocol MenuAPIManagerDelegate {
    func didGetMenuItemsCompletion(menuItems: [MenuItem])
    func didGetMenuItemsFailure(error: Error)
}

final class MenuAPIManagerImplementation: MenuAPIManager {
    
    let apiClient: MenuAPIClient
    var delegate: MenuAPIManagerDelegate?
    
    init(apiClient: MenuAPIClient = MenuAPIClientImplementation()) {
        self.apiClient = apiClient
    }
    
    func setMenuItemsDelegate(_ delegate: MenuAPIManagerDelegate) {
        self.delegate = delegate
    }
    
    func getMenuItems() {
        apiClient.getMenuItems { (optionalMenuItems, optionalError) in
            if let error = optionalError {
                self.delegate?.didGetMenuItemsFailure(error: error)
                
                return
            }
            
            if let menuItems = optionalMenuItems {
                self.delegate?.didGetMenuItemsCompletion(menuItems: menuItems)
            }
        }
    }
    
}
