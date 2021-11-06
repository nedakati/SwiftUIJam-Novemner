//
//  LocationMapView.swift
//  MySpot
//
//  Created by Katalin Neda on 06.11.2021.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding private var spot: Spot
    @State private var region: MKCoordinateRegion

    init(spot: Binding<Spot>) {
        self._spot = spot
        self._region = State(initialValue: MKCoordinateRegion(center: spot.coordinates.wrappedValue,
                                                              span: MKCoordinateSpan(latitudeDelta: 00.1, longitudeDelta: 00.1)))
    }
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24) {
                Map(coordinateRegion: $region, annotationItems: [spot]) { spot in
                    MapAnnotation(coordinate: spot.coordinates) {
                        MapAnnotationView()
                    }
                }
                .cornerRadius(16)
                .frame(height: 200)
                
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .navigationTitle("Find your spot")
        }
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView(spot: .constant(Spot(location: "Location", coordinates: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing")))
    }
}
