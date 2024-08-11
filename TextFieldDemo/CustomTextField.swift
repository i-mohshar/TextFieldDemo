//
//  CustomTextField.swift
//  TextFieldDemo
//
//  Created by Mohit Sharma on 11/8/2024.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var errorMessage: String?
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(placeholder, text: $text)
                .padding()
                .keyboardType(keyboardType)
            Rectangle()
                .fill(errorMessage == nil ? Color.gray : Color.red)
                .frame(height: 1)
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        .padding(.bottom, 10)
    }
}
