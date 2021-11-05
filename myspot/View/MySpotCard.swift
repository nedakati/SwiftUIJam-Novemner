//
//  MySpotCard.swift
//  MySpot
//
//  Created by Katalin Neda on 05.11.2021.
//

import SwiftUI
import MapKit

struct MySpotCard: View {
    
    private let spot: Spot
    private let onSelect: (() -> Void)?
    
    @State private var region: MKCoordinateRegion //= MKCoordinateRegion()
    
    init(spot: Spot, onSelect: (() -> Void)?) {
        self.spot = spot
        self.onSelect = onSelect
        self._region = State(initialValue: MKCoordinateRegion(center: spot.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)))
    }

    var body: some View {
        VStack(alignment: .leading) {
            Map(coordinateRegion: $region)
                .frame(height: 130)
                .cornerRadius(16)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.green, lineWidth: 1)
                )
            Text("\(spot.location)")
                .font(.body)
                .cornerRadius(16)
            Text("\(spot.instuctions)")
                .font(.caption)
                .foregroundColor(Color.gray)
        }
        .padding()
        .onTapGesture {
            self.onSelect?()
        }
    }
}

struct MySpotCard_Previews: PreviewProvider {
    static var previews: some View {
        MySpotCard(spot: Spot(location: "Location", coordinates: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing"), onSelect: {
        })
    }
}
