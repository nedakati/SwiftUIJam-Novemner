//
//  ContentView.swift
//  MySpot
//
//  Created by Katalin Neda on 05.11.2021.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Hunt", systemImage: "house")
                }
            SpotsView()
                .tabItem {
                    Label("Spots", systemImage: "list.dash")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
