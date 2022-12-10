//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by Charlie Nevitt on 10/31/22.
//

import SwiftUI

@main
struct CoreDataExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
