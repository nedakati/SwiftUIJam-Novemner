//
//  FireworkView.swift
//  MySpot
//
//  Created by Katalin Neda on 07.11.2021.
//

import SwiftUI

struct FireworkView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accent)
                .frame(width: 10, height: 10)
                .modifier(FireworkModifier(numberOfParticles: 120))
                .offset(x: -100, y: -50)
            
            Circle()
                .fill(Color.blue)
                .frame(width: 10, height: 10)
                .modifier(FireworkModifier(numberOfParticles: 120))
                .offset(x: 60, y: 70)
        }
    }
}

struct FireworkView_Previews: PreviewProvider {
    static var previews: some View {
        FireworkView()
    }
}
