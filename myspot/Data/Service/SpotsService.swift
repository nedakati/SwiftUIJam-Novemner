//
//  SpotsService.swift
//  MySpot
//
//  Created by Katalin Neda on 06.11.2021.
//

import SwiftUI
import Combine

final class SpotsService: ObservableObject {

    @Published var spots: [Spot] = []
    
    init() {
        spots = [Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing"),
                 Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "2", instuctions: "Nothing")]
    }
    
    func add(spot: Spot) {
        spots.append(spot)
    }
}
