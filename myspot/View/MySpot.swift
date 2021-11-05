//
//  MySpot.swift
//  MySpot
//
//  Created by Katalin Neda on 05.11.2021.
//

import SwiftUI

struct MySpot: View {
    
    @Binding var spot: Spot?
    
    var body: some View {
        Text("\(spot?.number ?? "")")
    }
}

import CoreLocation

struct MySpot_Previews: PreviewProvider {
    static var previews: some View {
        MySpot(spot: .constant(Spot(location: "Location", coordinates: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing")))
    }
}
