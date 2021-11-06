//
//  MySpotApp.swift
//  MySpot
//
//  Created by Katalin Neda on 05.11.2021.
//

import SwiftUI

@main
struct MySpotApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()

        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
