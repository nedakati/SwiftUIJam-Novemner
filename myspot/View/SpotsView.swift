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
                         Spot(location: "Location", coordinates: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing")]
    
    @State private var selectedSpot: Spot?
    @State private var presentDetailScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(spots, id: \.id) { spot in
                    MySpotCard(spot: spot, onSelect: {
                        self.selectedSpot = spot
                        print(selectedSpot)
                        self.presentDetailScreen.toggle()
                    })
                }
                .hideRowSeparator()
            }
            .navigationTitle("My Spots")
            .sheet(isPresented: $presentDetailScreen) {
                if let spot = selectedSpot {
                    MySpot(spot: spot)
                } else {
                     Text("No Spot")
                }
            }
        }
    }
}

struct SpotsView_Previews: PreviewProvider {
    static var previews: some View {
        SpotsView()
    }
}
