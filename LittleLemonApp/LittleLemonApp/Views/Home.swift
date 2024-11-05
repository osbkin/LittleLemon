//
//  Home.swift
//  LittleLemonApp
//
//

import SwiftUI

struct Home: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var isUserProfileTapped = false
    

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    LittleLemonLogoView()
                        .frame(width: 160, height: 60)
                    Spacer()
                    VStack {
                        Image("Profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .onTapGesture {
                                isUserProfileTapped.toggle()
                            }
                        
                        // Navigate to the user profile page
                        NavigationLink("", destination: UserProfile().navigationBarTitle("Personal Information"), isActive: $isUserProfileTapped)
                    }
                }
                .padding(.horizontal)
                
                HeroView()
                
                // Menu categories
                MenuCategoriesView()
                    .padding(.horizontal)
                
                // MenuItems
                MenuDishes()
            }
        }

        .tint(.primaryGreen)
    }
}

#Preview {
    Home().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
