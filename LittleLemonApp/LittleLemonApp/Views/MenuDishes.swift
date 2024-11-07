//
//  MenuDishes.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko
//

import SwiftUI
import CoreData

struct MenuDishes: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    @State private var showAlert = false
    @State var searchText = ""
    @State var activeFilter: MenuCategory?
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            SearchField(searchText: $searchText)
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(Color.primaryGreen)
            
            // Menu categories
            MenuCategoriesView(activeFilter: $activeFilter)
                .padding(.horizontal, 16)
            
            Divider()
            
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id:\.self) { dish in
                            DisplayDishView(dish: dish)
                                .onTapGesture {
                                    viewModel.selectedDish = dish
                                }
                        }
                        .onTapGesture {
                            showAlert.toggle()
                        }
                    }
                }
        }
        
        .padding(.top, -10)
        .sheet(isPresented: $viewModel.isShowingDetailView
        ) {
            DetailDishView(dish: viewModel.selectedDish!, isShowingDetailView: $viewModel.isShowingDetailView)
        }
        .frame(maxWidth: .infinity, minHeight: 300)
        // makes the list background invisible, default is gray
        .scrollContentBackground(.hidden)
        
        // runs when the view appears
        .task {
            await dishesModel.reload(viewContext)
        }
    }
    
    
    func buildPredicate() -> NSPredicate {
        
        var subpredicates: [NSPredicate] = []
               if !searchText.isEmpty {
                   let searchPredicate = NSPredicate(format: "name CONTAINS[cd] %@", searchText)
                   subpredicates.append(searchPredicate)
               }
               if let activeFilter = activeFilter {
                   let filterPredicate = NSPredicate(format: "category MATCHES[cd] %@", activeFilter.rawValue)
                   subpredicates.append(filterPredicate)
               }
               let finalPredicate: NSCompoundPredicate = .init(type: .and,
                                                               subpredicates: subpredicates)
               return finalPredicate
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "name",
                                 ascending: true,
                                 selector: #selector(NSString.localizedStandardCompare))]
    }
}


#Preview {
    MenuDishes()
}
