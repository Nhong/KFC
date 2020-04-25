//
//  RegistrationController.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

class RegistrationController {
    
    let registrationAPIManager: RegistrationAPIManager
    
    init(registrationAPIManager: RegistrationAPIManager = RegistrationAPIManagerImplementation()) {
        self.registrationAPIManager = registrationAPIManager
        self.registrationAPIManager.setRegistrationAPIManagerDelegate(self)
    }
    
    func registerWithName(_ optionalName: String?,
                          optionalSurname: String?,
                          optionalAddress: String?,
                          optionalTelephoneNumber: String?,
                          optionalEmail: String?,
                          optionalPassword: String?) {
        registrationAPIManager.registerWithName(optionalName,
                                                optionalSurname: optionalSurname,
                                                optionalAddress: optionalAddress,
                                                optionalTelephoneNumber: optionalTelephoneNumber,
                                                optionalEmail: optionalEmail,
                                                optionalPassword: optionalPassword)
    }
    
}

extension RegistrationController: RegistraionAPIManagerDelegate {
    
    func didRegistrationCompletion() {
        print("Registration Completion")
    }
    
    func didRegistrationFailure(error: Error) {
        print(ErrorHelperImplementation.ErrorMessage(errorHelper: error as! ErrorHelper))
    }
    
}
