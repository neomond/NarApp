//
//  PhoneNumberValidator.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 01.02.24.
//

import Foundation

struct PhoneNumberValidator {
    private let validLengthWithoutCountryCode = 9
    private let countryCode = "+994"

    func isValidPhoneNumber(_ number: String) -> Bool {
         let digitsOnly = number.filter { $0.isNumber }
         if number.hasPrefix(countryCode) {
             return digitsOnly.count == validLengthWithoutCountryCode + countryCode.filter { $0.isNumber }.count
         } else {
             return digitsOnly.count == validLengthWithoutCountryCode
         }
     }
    
}
