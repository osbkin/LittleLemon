//
//  Onboarding.swift
//  LittleLemonApp
//
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kFEmail = "email key"

struct Onboarding: View {
    enum NameFields {
        case firstName
        case lastName
        case email
    }
    
    @State var firstName: String = ""
    @State var lastName: String
    @State var email: String
    @FocusState private var nameFields: NameFields?
    
    // Computed property to check if all fields are filled
    private var allFieldsFilled: Bool {
        !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty
    }
    
    var body: some View {
        
        VStack {
            LittleLemonLogoView()
                .padding([.leading, .trailing], 100)
            HeroView()
            
            // Add text fields to register a new user
            TextFieldView(textField: $firstName, title: "First name", placeholderText: "Enter your first name")
                .focused($nameFields, equals: .firstName)
            
                .onSubmit {
                    nameFields = .lastName
                }
            
            TextFieldView(textField: $lastName, title: "Last name", placeholderText: "Enter your last name")
                .focused($nameFields, equals: .lastName)
                .onSubmit {
                    nameFields = .email
                }
            
            TextFieldView(textField: $email, title: "Email", placeholderText: "Enter your email")
                .focused($nameFields, equals: .email)
                .keyboardType(.emailAddress)
        }
        
        Spacer()
        
        Button {
            if allFieldsFilled  {
                UserDefaults.standard.set(firstName, forKey: kFirstName)
                UserDefaults.standard.set(lastName, forKey: kLastName)
                UserDefaults.standard.set(email, forKey: kFEmail)
                print("Go to the next screen")
            }
        } label: {
            Text("Register")
                .fontWeight(.semibold)
        }
        .padding(EdgeInsets(top: 12, leading: 64, bottom: 12, trailing: 64))
        .foregroundStyle(!allFieldsFilled ? .gray1 : .gray3)
        .background(!allFieldsFilled ? .gray2 : .secondaryYellow, in: Capsule())
        .disabled(!allFieldsFilled)
        .padding(.bottom, 18)
    }
}

#Preview {
    Onboarding(firstName: "", lastName: "", email: "")
}
