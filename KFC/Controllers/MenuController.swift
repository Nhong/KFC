//
//  MenuController.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

class MenuController {
    
    let menuAPIManager: MenuAPIManager
        
    init(menuAPIManager: MenuAPIManager = MenuAPIManagerImplementation()) {
        self.menuAPIManager = menuAPIManager
        self.menuAPIManager.setMenuItemsDelegate(self)
    }
    
    func getMenuItems() {
        menuAPIManager.getMenuItems()
    }
    
}

extension MenuController: MenuAPIManagerDelegate {
    
    func didGetMenuItemsCompletion(menuItems: [MenuItem]) {
        menuItems.forEach{ print($0.name) }
    }
    
    func didGetMenuItemsFailure(error: Error) {
        print(ErrorHelperImplementation.ErrorMessage(
                  errorHelper: error as! ErrorHelper))
    }
    
}
