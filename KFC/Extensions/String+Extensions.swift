//
//  String+Extensions.swift
//  KFC
//
//  Created by Kittinun Chobtham on 12/4/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

extension String {
    
    func isNotSpacing() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines) != " "
    }

}
