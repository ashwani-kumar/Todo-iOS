//
//  Curatio_TodoApp.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-10.
//

import SwiftUI

@main
struct Curatio_TodoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
