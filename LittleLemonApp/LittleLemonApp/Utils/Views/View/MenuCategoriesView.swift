//
//  MenuBreakdown.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-11-07.
//

import SwiftUI

struct MenuCategoriesView: View {
    
    @Binding var activeFilter: MenuCategory?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ORDER FOR DELIVERY!")
                .font(.headline)
                .fontWeight(.bold)
            ScrollView(.horizontal){
                HStack(spacing: 8) {
                    ForEach(MenuCategory.allCases, id: \.rawValue) { category in
                        
                        Text(category.rawValue.capitalized)
                            .foregroundColor(activeFilter == category ? Color.white : .black)
                            .font(.headline)
                            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .background{
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(activeFilter == category ? .primaryGreen : .lightGreen.opacity(0.6))
                            }
                            .onTapGesture {
                                applyFilter(selectedFilter: category)
                            }
                        if category != .drinks {
                            Spacer()
                        }
                        
                    }
                }
            }
        }
    }
}

extension MenuCategoriesView {
    private func applyFilter(selectedFilter: MenuCategory){
        if selectedFilter == activeFilter {
            self.activeFilter = nil
        } else {
            self.activeFilter = selectedFilter
        }
    }
}

#Preview {
    MenuCategoriesView(activeFilter: .constant(.mains))
}
