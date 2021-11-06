//
//  TextField+Underline.swift
//  MySpot
//
//  Created by Katalin Neda on 06.11.2021.
//

import SwiftUI

extension TextField {

    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().foregroundColor(.accent).frame(height: 2).padding(.top, 35))
    }
}
