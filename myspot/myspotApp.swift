//
//  myspotApp.swift
//  myspot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI

@main
struct myspotApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
