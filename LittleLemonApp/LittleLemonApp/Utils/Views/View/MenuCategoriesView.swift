//
//  Menu.swift
//  LittleLemonApp
//
//

import SwiftUI

struct MenuCategoriesView: View {
    private let categories = ["Starters", "Mains", "Desserts", "Drinks"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ORDER FOR DELIVERY!")
                .font(.headline)
                .fontWeight(.bold)
                
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(categories, id: \.self) { category in
                        
                        Button {
                        } label: {
                            Text(category)
                                .font(.headline)
                        }
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .foregroundStyle(.primaryGreen)
                        .background(Color.lightGreen.opacity(0.3), in: Capsule())
                    }
                }
            }
        }
    }
}

#Preview {
    MenuCategoriesView()
}
