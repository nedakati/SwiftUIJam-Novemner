//
//  PopupView.swift
//  MySpot
//
//  Created by Katalin Neda on 07.11.2021.
//

import SwiftUI

struct PopupView<T: View>: View {
    
    @Binding var showPopup: Bool
    var contentView: T
    
    init(showPopup: Binding<Bool>, content: () -> T) {
        self._showPopup = showPopup
        self.contentView = content()
    }
    
    var body: some View {
        ZStack {
            if showPopup {
                Color.white.opacity(0.5).edgesIgnoringSafeArea(.all) // try with black as well
                
                contentView
                
                Button("Collect", action: {
                    withAnimation(.linear(duration: 0.3)) {
                        showPopup = false
                    }
                })
                    .buttonStyle(AccentButtonStyle())
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
            }
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(showPopup: .constant(true)) {
            Text("Hello")
        }
    }
}
