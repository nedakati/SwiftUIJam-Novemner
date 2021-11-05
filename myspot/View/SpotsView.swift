//
//  SpotsView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI
import CoreLocation

struct SpotsView: View {
    
    let spots: [Spot] = [Spot(location: "Location", coordinates: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing"),
                         Spot(location: "Location", coordinates: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), number: "2", instuctions: "Nothing")]
    
    @State private var selectedSpot: Spot?
    @State private var presentDetailScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(spots, id: \.id) { spot in
                    MySpotCard(spot: spot, onSelect: {
                        self.selectedSpot = spot
                        self.presentDetailScreen.toggle()
                    })
                }
                .hideRowSeparator()
            }
            .navigationTitle("My Spots")
            .sheet(isPresented: $presentDetailScreen) {
                MySpot(spot: $selectedSpot)
            }
        }
    }
}

struct SpotsView_Previews: PreviewProvider {
    static var previews: some View {
        SpotsView()
    }
}
