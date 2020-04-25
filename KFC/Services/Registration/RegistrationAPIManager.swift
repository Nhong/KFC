//
//  RegistrationAPIManager.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol RegistrationAPIManager {
    func registerWithName(_ optionalName: String?,
                          optionalSurname: String?,
                          optionalAddress: String?,
                          optionalTelephoneNumber: String?,
                          optionalEmail: String?,
                          optionalPassword: String?)
    func setRegistrationAPIManagerDelegate(_ delegate: RegistraionAPIManagerDelegate)
}

protocol RegistraionAPIManagerDelegate {
    func didRegistrationCompletion()
    func didRegistrationFailure(error: Error)
}

final class RegistrationAPIManagerImplementation: RegistrationAPIManager {
    
    var delegate: RegistraionAPIManagerDelegate?
    
    let apiClient: RegistrationAPIClient
    
    init(apiClient: RegistrationAPIClient = RegistrationAPIClientImplementation()) {
        self.apiClient = apiClient
    }
    
    func registerWithName(_ optionalName: String?,
                          optionalSurname: String?,
                          optionalAddress: String?,
                          optionalTelephoneNumber: String?,
                          optionalEmail: String?,
                          optionalPassword: String?) {
        apiClient.registerWithName(optionalName,
                                   optionalSurname: optionalSurname,
                                   optionalAddress: optionalAddress,
                                   optionalTelephoneNumber: optionalTelephoneNumber,
                                   optionalEmail: optionalEmail,
                                   optionalPassword: optionalPassword)
        { (status, optionalError) in
            if let error = optionalError {
                self.delegate?.didRegistrationFailure(error: error)
                
                return
            }
            
            if status {
                self.delegate?.didRegistrationCompletion()
            }
            
        }
    }
    
    func setRegistrationAPIManagerDelegate(_ delegate: RegistraionAPIManagerDelegate) {
        self.delegate = delegate
    }
    
}
