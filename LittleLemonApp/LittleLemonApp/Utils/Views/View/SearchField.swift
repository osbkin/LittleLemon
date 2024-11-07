//
//  SearchField.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-11-07.
//

import SwiftUI

struct SearchField: View {
    @State private var isEditing: Bool = false
    @Binding var searchText: String
    
    // Define the initial and expanded widths
    private let initialWidth: CGFloat = 20
    private let expandedWidth: CGFloat = UIScreen.main.bounds.width - 64
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(10)
                .padding(.horizontal, 30)
                .foregroundColor(.gray3)
                .background(isEditing ? Color.white.opacity(0.3) : Color.white.opacity(0.1))
                .cornerRadius(isEditing ? 16 : 22)
                .frame(width: isEditing ? expandedWidth : initialWidth) // Adjust width based on isEditing state
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                        
                        Spacer()
                        
                        if isEditing {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 8)
                                    .onTapGesture(perform: { CGPoint in
                                        isEditing = false
                                    })
                            }
                        }
                    }
                )
                .animation(.easeInOut(duration: 0.2), value: isEditing) // Add smooth transition
                .onTapGesture {
                    withAnimation {
                        isEditing = true
                    }
                }
                .onSubmit {
                    // Trigger shrinking when editing ends
                    withAnimation {
                        isEditing = false
                    }
                }
            
            if isEditing {
                Button("") {
                    withAnimation {
                        isEditing = false
                        searchText = ""
                    }
                }
                .foregroundColor(.blue)
                .transition(.move(edge: .trailing))
                .animation(.easeInOut(duration: 0.2), value: isEditing)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SearchField(searchText: .constant(""))
}
