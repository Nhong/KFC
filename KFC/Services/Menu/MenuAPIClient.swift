//
//  MenuAPIClient.swift
//  KFC
//
//  Created by Kittinun Chobtham on 18/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol MenuAPIClient {
    func getMenuItems(completion: @escaping (_ items: [MenuItem]?, _ error: Error?) -> ())
}

final class MenuAPIClientImplementation: MenuAPIClient {
    
    var optionalMenuItems: [MenuItem]? =  [MenuItem(name: "ไก่ไม่มีกระดูกสโมกกี้บาร์บีคิวบักเก็ต",
                                                    price: 259,
                                                    quantity: 0),
                                           MenuItem(name: "เดอะบอกซ์ไก่ไม่มีกระดูกสโมกกี้บาร์บีคิว",
                                                    price: 149,
                                                    quantity: 0),
                                           MenuItem(name: "บักเก็ตรวมสุขไก่ไม่มีกระดูกสโมกกี้บาร์บีคิว",
                                                    price: 499,
                                                    quantity: 0)]
    
    func getMenuItems(completion: @escaping (_ items: [MenuItem]?, _ error: Error?) -> ()) {
        guard let items = optionalMenuItems else {
            completion(nil, ErrorHelper.CannotGetMenuItems)
            
            return
        }
        
        mockMenuItems = items
        
        completion(items, nil)
    }
    
}
