//
//  RegistrationAPIClient.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol RegistrationAPIClient {
    func registerWithName(_ optionalName: String?,
                          optionalSurname: String?,
                          optionalAddress: String?,
                          optionalTelephoneNumber: String?,
                          optionalEmail: String?,
                          optionalPassword: String?,
                          completion: @escaping (_ status: Bool, _ error: Error?) -> ())
}

final class RegistrationAPIClientImplementation: RegistrationAPIClient {
    
    func registerWithName(_ optionalName: String?,
                          optionalSurname: String?,
                          optionalAddress: String?,
                          optionalTelephoneNumber: String?,
                          optionalEmail: String?,
                          optionalPassword: String?,
                          completion: @escaping (Bool, Error?) -> ()) {
        guard let name = optionalName, name.isNotSpacing() else {
                completion(false,
                           ErrorHelper.NameNotFound)
                return
        }
        
        guard let surname = optionalSurname, surname.isNotSpacing() else {
                completion(false, ErrorHelper.SurnameNotFound)
                
                return
        }
        
        guard let address
            = optionalAddress, address.isNotSpacing()  else {
                completion(false, ErrorHelper.AddressNotFound)
                
                return
        }
        
        guard let telephoneNumber = optionalTelephoneNumber,
            telephoneNumber.isNotSpacing() else {
                completion(false, ErrorHelper.TelephoneNumberNotFound)
                
                return
        }
        
        guard let email = optionalEmail, email.isNotSpacing() else {
            completion(false, ErrorHelper.EmailNotFound)
            
            return
        }
        
        guard let password = optionalPassword, password.isNotSpacing() else {
            completion(false, ErrorHelper.PasswordNotFound)
            
            return
        }
        
        let user = User(name: name,
                        surname: surname,
                        address: address,
                        telephoneNumber: telephoneNumber,
                        email: email,
                        password: password)
        
        mockUsers.append(user)
        
        completion(true, nil)
    }
}
