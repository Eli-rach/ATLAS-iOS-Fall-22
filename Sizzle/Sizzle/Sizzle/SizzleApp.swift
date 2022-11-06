//
//  SizzleApp.swift
//  Sizzle
//
//  Created by Charlie Nevitt on 11/2/22.
//

import SwiftUI

@main
struct SizzleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
