//
//  FormViewModel.swift
//  TextFieldDemo
//
//  Created by Mohit Sharma on 11/8/2024.
//

import Foundation
import Combine

class FormViewModel: ObservableObject {
    @Published var fields: [Field: String] = [:]
    @Published var errors: [Field: String?] = [:]

    enum Field: Hashable {
        case firstName, lastName, phoneNumber
    }
    
    func validateField(_ field: Field) {
        switch field {
        case .firstName:
            errors[.firstName] = fields[.firstName]?.isEmpty ?? true ? "First name is required" : nil
        case .lastName:
            errors[.lastName] = fields[.lastName]?.isEmpty ?? true ? "Last name is required" : nil
        case .phoneNumber:
            if let phone = fields[.phoneNumber], !phone.isEmpty {
                errors[.phoneNumber] = isValidAustralianPhoneNumber(phone) ? nil : "Invalid phone number"
            } else {
                errors[.phoneNumber] = "Phone number is required"
            }
        }
    }
    
    private func isValidAustralianPhoneNumber(_ number: String) -> Bool {
        let phonePattern = "^(04\\d{8})|(0[2378]\\d{8})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phonePattern)
        return predicate.evaluate(with: number)
    }
}
