//
//  Onboarding.swift
//  LittleLemonApp
//
//

import SwiftUI

struct Onboarding: View {
    enum NameFields {
        case firstName
        case lastName
        case email
    }
    
    @StateObject private var viewModel = ViewModel()
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn: Bool = false
    @FocusState private var nameFields: NameFields?
    
    // Computed property to check if all fields are filled
    private var allFieldsFilled: Bool {
        !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                LittleLemonLogoView()
                    .padding([.leading, .trailing], 100)
                HeroView()
                
                // Add text fields to register a new user
                VStack {
                    NavigationLink(destination: Home(), isActive: $isLoggedIn) {}
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
                .padding(.horizontal)
            }
            
            Spacer()
            
            Button {
                if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email) {
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                    UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    UserDefaults.standard.set(true, forKey: kOrderStatuses)
                    UserDefaults.standard.set(true, forKey: kPasswordChanges)
                    UserDefaults.standard.set(true, forKey: kSpecialOffers)
                    UserDefaults.standard.set(true, forKey: kNewsletter)
                    
                    firstName = ""
                    lastName = ""
                    email = ""
                    isLoggedIn = true
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
            .onAppear() {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
        .navigationBarBackButtonHidden()
        .tint(.primaryGreen)
    }
}

#Preview {
    Onboarding()
}
