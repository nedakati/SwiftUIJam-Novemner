//
//  FireworkModifier.swift
//  MySpot
//
//  Created by Katalin Neda on 07.11.2021.
//

import SwiftUI

struct FireworkModifier: ViewModifier {

    @State private var time: Double = 0.0
    @State private var scale = 0.1
    
    private let duration: Double = 2.5
    
    var numberOfParticles: Int
    
    init(numberOfParticles: Int) {
        self.numberOfParticles = numberOfParticles
    }
    
    func body(content: Content) -> some View {
            ZStack {
                ForEach(0..<numberOfParticles, id: \.self) { index in
                    content
                        .hueRotation(Angle(degrees: time * 80))
                        .scaleEffect(CGFloat(scale))
                        .modifier(FireworkGeometryEffect(time: time))
                        .opacity(((duration-time) / duration))
                }
            }
            .onAppear {
                withAnimation (.easeOut(duration: duration).repeatForever(autoreverses: false)) {
                    self.time = duration
                    self.scale = 1.0
                }
            }
        }
}
