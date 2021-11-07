//
//  SpotsService.swift
//  MySpot
//
//  Created by Katalin Neda on 06.11.2021.
//

import SwiftUI
import Combine

final class SpotsService {

    @ObservedObject var spots = SpotsModel()
    
    func add(spot: Spot) {
        spots.spots.append(spot)
    }
    
}
