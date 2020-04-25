//
//  LoginAPIClient.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol LoginAPIClient {
    func loginWithEmail(_ optionalEmail: String?,
                           optionalPassword: String?,
                           completion: @escaping (_ status: Bool, _ error: Error?) -> ())
}

final class LoginAPIClientImplementation: LoginAPIClient {
    
    func loginWithEmail(_ optionalEmail: String?,
                        optionalPassword: String?,
                        completion: @escaping (Bool, Error?) -> ()) {
        guard let email = optionalEmail, email.isNotSpacing() else {
            completion(false, ErrorHelper.EmailNotFound)
            
            return
        }
        
        guard let password = optionalPassword , password.isNotSpacing() else {
            completion(false, ErrorHelper.PasswordNotFound)
            
            return
        }
        
        let optionalUser = mockUsers.filter { (user) -> Bool in
            return user.email == email && user.password == password
        }
        
        if let userRegisted = optionalUser.first {
            currentUser = userRegisted
                 
            completion(true, nil)
        } else {
            completion(false, ErrorHelper.CannotRegitration)
        }
     
    }
    
}
