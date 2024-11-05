//
//  UserProfile.swift
//  LittleLemonApp
//
//

import SwiftUI

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    @Environment(\.presentationMode) var presentation
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    
    @State private var isLoggedOut = false
    
    
    var body: some View {
        NavigationLink(destination: Onboarding(), isActive: $isLoggedOut) {}
        VStack(alignment: .leading, spacing: 4) {
            Text("Avatar")
                .font(.callout)
                .fontWeight(.semibold)
            HStack(spacing: 12) {
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                // MARK: - Add action to "Change" button
                Button {
                    
                } label: {
                    GreenButtonFilledStyle(title: "Change")
                }
                // MARK: - Add action to "Remove" button
                Button {} label: {
                    GreenButtonBorderedStyle(title: "Remove")
                }
                Spacer()
            }
            
            TextFieldView(textField: $firstName, title: "First Name", placeholderText: "Add your first name")
            TextFieldView(textField: $lastName, title: "Last Name", placeholderText: "Add your first name")
            TextFieldView(textField: $email, title: "Email", placeholderText: "Add your first name")
            TextFieldView(textField: $phoneNumber, title: "Phone number", placeholderText: "Add your first name")
                .keyboardType(.phonePad)
            
            VStack(alignment: .leading) {
                Text("Notification")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                CheckBoxView(isChecked:  $orderStatuses, itemText: "Order statuses")
                CheckBoxView(isChecked: $passwordChanges, itemText: "Password changes")
                CheckBoxView(isChecked: $specialOffers, itemText: "Special offers")
                CheckBoxView(isChecked: $newsletter, itemText: "Newsletter")
            }
            
            Button {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                UserDefaults.standard.set("", forKey: kPhoneNumber)
                UserDefaults.standard.set(false, forKey: kOrderStatuses)
                UserDefaults.standard.set(false, forKey: kPasswordChanges)
                UserDefaults.standard.set(false, forKey: kSpecialOffers)
                UserDefaults.standard.set(false, forKey: kNewsletter)
                isLoggedOut = true
                
            } label: {
                YellowButtonFilledStyle(title: "Log out")
            }
            
            HStack(spacing: 10) {
                Button {
                    firstName = viewModel.firstName
                    lastName = viewModel.lastName
                    email = viewModel.email
                    phoneNumber = viewModel.phoneNumber
                    
                    orderStatuses = viewModel.orderStatuses
                    passwordChanges = viewModel.passwordChanges
                    specialOffers = viewModel.specialOffers
                    newsletter = viewModel.newsletter
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    GreenButtonBorderedStyle(title: "Discard changes")
                }
                
                Button {
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                        UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
                        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
                        self.presentation.wrappedValue.dismiss()
                    }
                } label: {
                    GreenButtonFilledStyle(title: "Save changes")
                }
            }
            .padding(.horizontal, 30)
        }
        .padding(.horizontal)
        .onAppear {
                    firstName = viewModel.firstName
                    lastName = viewModel.lastName
                    email = viewModel.email
                    phoneNumber = viewModel.phoneNumber
                    
                    orderStatuses = viewModel.orderStatuses
                    passwordChanges = viewModel.passwordChanges
                    specialOffers = viewModel.specialOffers
                    newsletter = viewModel.newsletter
                }
    }
}

#Preview {
    UserProfile()
}
