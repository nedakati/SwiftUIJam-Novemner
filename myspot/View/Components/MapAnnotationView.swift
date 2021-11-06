//
//  MapAnnotation.swift
//  MySpot
//
//  Created by Katalin Neda on 06.11.2021.
//

import SwiftUI

struct MapAnnotationView: View {
    
    @State var isAnimating = false
    
    @State private var scaleAmount: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            Image("mapLocation")
                .resizable()
                .frame(width: 40, height: 40)
                .overlay(
                    Circle()
                        .stroke(Color.accent)
                        .scaleEffect(scaleAmount)
                        .opacity(Double(2 - scaleAmount))
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: false))
                )
                .onAppear {
                    self.scaleAmount = 2
                }
        }
    }
}

struct MapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}
