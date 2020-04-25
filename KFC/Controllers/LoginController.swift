//
//  LoginController.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

class LoginController {
    
    let loginAPIManager: LoginAPIManager
    
    init(loginAPIManager: LoginAPIManager = LoginAPIManagerImplementation()) {
        self.loginAPIManager = loginAPIManager
        self.loginAPIManager.setLoginDelegate(self)
    }
    
    func loginWithEmail(_ email: String?,
                        password: String?) {
        loginAPIManager.loginWithEmail(email,
                                       optionalPassword: password)
    }
    
}

extension LoginController: LoginAPIManagerDelegate {
    
    func didLoginCompletion() {
        print("Login Completion")
    }
    
    func didLoginFailure(error: Error) {
        print(ErrorHelperImplementation.ErrorMessage(
            errorHelper: error as! ErrorHelper))
    }
    
}

