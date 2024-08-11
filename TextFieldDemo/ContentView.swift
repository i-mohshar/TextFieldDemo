//
//  ContentView.swift
//  TextFieldDemo
//
//  Created by Mohit Sharma on 11/8/2024.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FormViewModel()
    @FocusState private var focusedField: FormViewModel.Field?

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // First Name Field
            CustomTextField(
                text: Binding(
                    get: { viewModel.fields[.firstName] ?? "" },
                    set: { viewModel.fields[.firstName] = $0 }
                ),
                placeholder: "Enter your first name",
                errorMessage: viewModel.errors[.firstName] ?? nil
            )
            .focused($focusedField, equals: .firstName)
            
            // Last Name Field
            CustomTextField(
                text: Binding(
                    get: { viewModel.fields[.lastName] ?? "" },
                    set: { viewModel.fields[.lastName] = $0 }
                ),
                placeholder: "Enter your last name",
                errorMessage: viewModel.errors[.lastName] ?? nil
            )
            .focused($focusedField, equals: .lastName)
            
            // Phone Number Field
            CustomTextField(
                text: Binding(
                    get: { viewModel.fields[.phoneNumber] ?? "" },
                    set: { viewModel.fields[.phoneNumber] = $0 }
                ),
                placeholder: "Enter your phone number",
                errorMessage: viewModel.errors[.phoneNumber] ?? nil,
                keyboardType: .phonePad
            )
            .focused($focusedField, equals: .phoneNumber)
            
            // Submit Button
            Button(action: {
                focusedField = nil // Dismiss the keyboard
                submitForm()
            }) {
                Text("Submit")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(!formIsValid)
        }
        .padding()
        .onChange(of: focusedField) { [previous = focusedField] newField in
            if let previous = previous {
                viewModel.validateField(previous)
            }
        }
    }

    private var formIsValid: Bool {
        return viewModel.errors.values.allSatisfy { $0 == nil }
    }
    
    private func submitForm() {
        print("Form submitted with: \(viewModel.fields)")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
