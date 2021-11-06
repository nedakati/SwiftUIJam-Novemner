//
//  AccentButtonStyle.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI

struct AccentButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
                .padding(12)
            Spacer()
        }
        .background(Color.accentColor)
        .foregroundColor(.white)
        .cornerRadius(8)
        .opacity(configuration.isPressed ? 0.6 : 1)
    }
}
