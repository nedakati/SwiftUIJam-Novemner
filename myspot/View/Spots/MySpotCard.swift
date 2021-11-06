//
//  MySpotCard.swift
//  MySpot
//
//  Created by Katalin Neda on 05.11.2021.
//

import SwiftUI
import MapKit

struct MySpotCard: View {
    
    @Binding private var spot: Spot

    @State private var region: MKCoordinateRegion
    @State private var openTimeRangePicker: Bool = false

    private let onSelect: (() -> Void)?

    
    init(spot: Binding<Spot>, onSelect: (() -> Void)?) {
        self._spot = spot
        self.onSelect = onSelect
        self._region = State(initialValue: MKCoordinateRegion(center: spot.coordinates.wrappedValue, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)))
    }

    var body: some View {
        VStack(alignment: .leading) {
            Map(coordinateRegion: $region)
                .frame(height: 130)
                .cornerRadius(16)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.accent, lineWidth: 1)
                )
            Text("\(spot.location)")
                .font(.body)
                .cornerRadius(16)
            Text("Parking number: \(spot.number)")
                .font(.caption)
                .foregroundColor(Color.gray)
            
            Button("Make this spot available", action: {
                self.openTimeRangePicker.toggle()
            })
                .buttonStyle(AccentButtonStyle())
                .padding()
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
            .sheet(isPresented: $openTimeRangePicker) {
                MakeSpotAvailable(spot: $spot)
            }
        }
        .padding()
        .onTapGesture {
            self.onSelect?()
        }
    }
}

struct MySpotCard_Previews: PreviewProvider {
    static var previews: some View {
        MySpotCard(spot: .constant(Spot(location: "Location", coordinates: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing")), onSelect: { })
    }
}
