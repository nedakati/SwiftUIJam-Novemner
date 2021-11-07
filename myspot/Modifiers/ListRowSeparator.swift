//
//  ListRowSeparator.swift
//  MySpot
//
//  Created by Katalin Neda on 05.11.2021.
//

import SwiftUI

struct ListRowSeparator: ViewModifier {
    
    var insets: EdgeInsets
    
    init(insets: EdgeInsets) {
        self.insets = insets
    }
    
    func body(content: Content) -> some View {
        content
            .padding(insets)
            .frame(
                minWidth: 0, maxWidth: .infinity,
                minHeight: 44,
                alignment: .leading
            )
            .listRowInsets(EdgeInsets())
            .background(Color.white)
    }
}

extension View {
    func hideRowSeparator() -> some View {
        modifier(ListRowSeparator(insets: EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 0)))
    }
}
