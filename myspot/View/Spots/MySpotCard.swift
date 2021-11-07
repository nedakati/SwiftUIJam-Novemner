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
        let coordinates = CLLocationCoordinate2D(latitude: spot.coordinates.wrappedValue.latitude,
                                                 longitude: spot.coordinates.wrappedValue.longitude)
        self._region = State(initialValue: MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)))
    }

    var body: some View {
        VStack(alignment: .leading) {
            Map(coordinateRegion: $region, annotationItems: [spot]) { spot in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: spot.coordinates.latitude,
                                                                 longitude: spot.coordinates.longitude)) {
                    MapAnnotationView()
                }
            }
                .frame(height: 130)
                .cornerRadius(16)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.accent, lineWidth: 1)
                )
            Text("\(spot.address)")
                .font(.body)
                .cornerRadius(16)
            Text("Parking number: \(spot.number)")
                .font(.caption)
                .foregroundColor(Color.gray)
            
            if !spot.isPublished {
                Button("Publish spot", action: {
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
            } else {
                Button("Cancel Published Spot", action: {
                    self.spot.isPublished = false
                })
                    .buttonStyle(BorderButtonStyle())
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
                .sheet(isPresented: $openTimeRangePicker) {
                    MakeSpotAvailable(spot: $spot)
                }
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
        MySpotCard(spot: .constant(Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing")), onSelect: { })
    }
}
