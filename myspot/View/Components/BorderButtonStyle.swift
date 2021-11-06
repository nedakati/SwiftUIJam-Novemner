//
//  BorderButtonStyle.swift
//  MySpot
//
//  Created by Katalin Neda on 06.11.2021.
//

import SwiftUI

struct BorderButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
                .padding(12)
            Spacer()
        }
        .background(Color.white)
        .foregroundColor(.accent)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(configuration.isPressed ? Color.accent.opacity(0.5) : .accent, lineWidth: 1.5)
        )
        .opacity(configuration.isPressed ? 0.6 : 1)
    }
}
