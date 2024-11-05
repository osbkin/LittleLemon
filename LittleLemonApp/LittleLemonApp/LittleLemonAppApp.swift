//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-10-28.
//

import SwiftUI

@main
struct LittleLemonAppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
