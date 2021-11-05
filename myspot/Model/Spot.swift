//
//  Spot.swift
//  MySpot
//
//  Created by Katalin Neda on 05.11.2021.
//

import Foundation
import CoreLocation

struct Spot: Identifiable {
    var id = UUID()
    var location: String
    var coordinates: CLLocationCoordinate2D
    var number: String
    var instuctions: String
}
