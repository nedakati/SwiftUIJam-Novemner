//
//  Spot.swift
//  MySpot
//
//  Created by Botond Magyarosi on 06.11.2021.
//

import Foundation
import CoreLocation

struct SpotAvailability: Codable {
    var startDate: Date
    var endDate: Date
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}

struct Spot: Codable, Identifiable {
    var id = UUID()
    var address: String
    var coordinates: Coordinates
    var number: String
    var instuctions: String
    let availability: [SpotAvailability]
    var isPublished: Bool = false
}
