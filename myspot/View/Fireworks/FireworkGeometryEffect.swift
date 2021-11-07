//
//  FireworksGeometryEffect.swift
//  MySpot
//
//  Created by Katalin Neda on 07.11.2021.
//

import SwiftUI

struct FireworkGeometryEffect: GeometryEffect {
    
    var speed: Double = Double.random(in: 20...200)
    var direction: Double = Double.random(in: -Double.pi...Double.pi)
    
    var time: Double
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation =  CGAffineTransform(translationX: CGFloat(xTranslation), y: CGFloat(yTranslation))
        return ProjectionTransform(affineTranslation)
    }
}
