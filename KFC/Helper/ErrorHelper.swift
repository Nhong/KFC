//
//  ErrorHelper.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

enum ErrorHelper: Error {
    case NameNotFound
    case SurnameNotFound
    case AddressNotFound
    case TelephoneNumberNotFound
    case EmailNotFound
    case PasswordNotFound
    case CannotRegitration
    case CannotGetMenuItems
}

final class ErrorHelperImplementation {
    
    class func ErrorMessage(errorHelper: ErrorHelper) -> String {
        switch errorHelper {
        case .AddressNotFound:
            return "ไม่พบข้อมูลที่อยู่ กรุณาลองใหม่อีกครั้ง"
        case .EmailNotFound:
            return "ไม่พบข้อมูล Email กรุณาลองใหม่อีกครั้ง"
        case .NameNotFound:
            return "ไม่พบชื่อของท่าน กรุณาลองใหม่อีกครั้ง"
        case .PasswordNotFound:
            return "ไม่พบข้อมูล Password กรุณาลองใหม่อีกครั้ง"
        case .SurnameNotFound:
            return "ไม่พบนามสกุลของท่าน กรุณาลองใหม่อีกครั้ง"
        case .TelephoneNumberNotFound:
            return "ไม่พบเบอร์โทรศัพท์ของท่าน กรุณาลองใหม่อีกครั้ง"
        case .CannotRegitration:
            return "คุณไม่ได้ทำการลงทะเบียน, กรุณาลงทะเบียน"
        case .CannotGetMenuItems:
            return "คุณไม่ได้สามารถ ดึงข้อมูลจากระบบได้, กรุณาลองใหม่อีกครั้ง"
        }
    }
    
}
