//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Olha Kostenko on 2024-10-28.
//

import SwiftUI

@main
struct LittleLemonAppApp: App {
    var body: some Scene {
        WindowGroup {
            Onboarding(firstName: "", lastName: "", email: "")
        }
    }
}
