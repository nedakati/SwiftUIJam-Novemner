//
//  SpotsView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI
import CoreLocation

struct SpotsView: View {
    
    @State var spots: [Spot] = [Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing", availability: []),
                                Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "2", instuctions: "Nothing", availability: [])]
    
    @State private var selectedSpot: Spot?
    @State private var presentDetailScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(spots.indices) { index in
                    MySpotCard(spot: $spots[index], onSelect: {
                        self.selectedSpot = spots[index]
                        self.presentDetailScreen.toggle()
                    })
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .separator, radius: 6, x: 0, y: 0)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    .sheet(isPresented: $presentDetailScreen) {
                        if selectedSpot != nil {
                            MySpotView(spot: Binding($selectedSpot)!)
                        }
                    }
                }
                .hideRowSeparator()
            }
            .navigationTitle("My Spots")
        }
    }
}

struct SpotsView_Previews: PreviewProvider {
    static var previews: some View {
        SpotsView()
    }
}
