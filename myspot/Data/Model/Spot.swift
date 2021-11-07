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

struct Spot: Identifiable, Codable {
    var id = UUID()
    
    var address: String
    var coordinates: Coordinates
    var number: String
    var instuctions: String
    var availability: [SpotAvailability]
    var isPublished: Bool = false
    
    init(address: String,
         coordinates: Coordinates,
         number: String,
         instuctions: String) {
        self.address = address
        self.coordinates = coordinates
        self.number = number
        self.instuctions = instuctions
        self.availability = []
    }
}

class SpotsModel: ObservableObject {
    
    @Published var spots: [Spot]

    init(){
        spots = [Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing"),
                 Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "2", instuctions: "Nothing")]
    }
}
