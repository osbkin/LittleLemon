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
    @State var firstName: String
    @State var lastName: String
    @State var email: String
    @State var allFilledOut: Bool = true
//    @State private var textFieldState: TextFieldState = .normal
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding([.leading, .trailing], 100)
            VStack {
                HeroView()
                Text("First Name")
                TextField("First Name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                    .padding(16)
                Text("First Name")
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(.roundedBorder)
                    .padding(16)
                Text("First Name")
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .padding(16)
            }
            Spacer()
  
            Button {
                if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kFEmail)
                }
            } label: {
                Text("Register")
                    .fontWeight(.semibold)
            }
            .padding(EdgeInsets(top: 12, leading: 64, bottom: 12, trailing: 64))
            .foregroundStyle(.gray3)
            .background(.secondaryYellow, in: Capsule())
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    Onboarding(firstName: "Olha", lastName: "Kostenko", email: "test@gmail.com")
}
