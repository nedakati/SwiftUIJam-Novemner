//
//  MySpot.swift
//  MySpot
//
//  Created by Katalin Neda on 05.11.2021.
//

import SwiftUI
import MapKit

struct MySpotView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding private var spot: Spot
    @State private var region: MKCoordinateRegion
    
    @State private var address: String
    @State private var number: String
    @State private var instructions: String

    init(spot: Binding<Spot>) {
        self._spot = spot
        let coordinates = CLLocationCoordinate2D(latitude: spot.coordinates.wrappedValue.latitude,
                                                 longitude: spot.coordinates.wrappedValue.longitude)
        self._region = State(initialValue: MKCoordinateRegion(center: coordinates,
                                                              span: MKCoordinateSpan(latitudeDelta: 00.1, longitudeDelta: 00.1)))
        
        self._address = State(initialValue: spot.address.wrappedValue)
        self._number = State(initialValue: spot.number.wrappedValue)
        self._instructions = State(initialValue: spot.instuctions.wrappedValue)
    }
    
    var body: some View {
            VStack(alignment: .leading, spacing: 24) {
                Map(coordinateRegion: $region, annotationItems: [spot]) { spot in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: spot.coordinates.latitude,
                                                                     longitude: spot.coordinates.longitude)) {
                        MapAnnotationView()
                    }
                }
                .cornerRadius(16)
                .frame(height: 200)
                
                VStack(alignment: .leading, spacing:4) {
                    Text("Change address")
                        .font(.callout)
                        .foregroundColor(.gray)
                    TextField("Address", text: $address)
                        .underlineTextField()
                }
                
                VStack(alignment: .leading, spacing:4) {
                    Text("Change parking space number")
                        .font(.callout)
                        .foregroundColor(.gray)
                    TextField("Number", text: $number)
                        .underlineTextField()
                }
                
                VStack(alignment: .leading, spacing:4) {
                    Text("Change instrunctions")
                        .font(.callout)
                        .foregroundColor(.gray)
                    TextField("Instructions", text: $instructions)
                        .underlineTextField()
                }
                
                Spacer()

                Button("Save changes", action: {
                    saveChanges()
                })
                    .buttonStyle(AccentButtonStyle())
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
            }
            .padding()
            .navigationTitle("Spot Details")
    }
    
    // MARK: - Private methods
    
    private func saveChanges() {
        spot.address = address
        spot.number = number
        spot.instuctions = instructions
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct MySpot_Previews: PreviewProvider {
    static var previews: some View {
        MySpotView(spot: .constant(Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing", availability: [])))
    }
}
