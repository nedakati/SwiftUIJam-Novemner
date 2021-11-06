//
//  Spot.swift
//  MySpot
//
//  Created by Botond Magyarosi on 06.11.2021.
//

import Foundation

struct SpotAvailability: Codable {
    var startDate: Date
    var endDate: Date
}

struct Spot: Codable {
    let address: String
    let availability: [SpotAvailability]
}
