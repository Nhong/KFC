//
//  LoginAPIManager.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol LoginAPIManager {
    func loginWithEmail(_ optionalEmail: String?,
                        optionalPassword: String?)
    func setLoginDelegate(_ delegate: LoginAPIManagerDelegate?)
}

protocol LoginAPIManagerDelegate {
    func didLoginCompletion()
    func didLoginFailure(error: Error)
}

final class LoginAPIManagerImplementation: LoginAPIManager {
    
    let apiClient: LoginAPIClient
    var delegate: LoginAPIManagerDelegate?
    
    init(apiClient: LoginAPIClient = LoginAPIClientImplementation()) {
        self.apiClient = apiClient
    }
    
    func setLoginDelegate(_ delegate: LoginAPIManagerDelegate?) {
        self.delegate = delegate
    }
    
    func loginWithEmail(_ optionalEmail: String?,
                        optionalPassword: String?) {
        apiClient.loginWithEmail(optionalEmail,
                                 optionalPassword: optionalPassword)
        { (status, optionalError) in
            if let error = optionalError {
                self.delegate?.didLoginFailure(error: error)
                
                return
            }
            
            if status {
                self.delegate?.didLoginCompletion()
            }
        }
    }

    
}
