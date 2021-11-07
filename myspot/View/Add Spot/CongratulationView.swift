//
//  CongratulationView.swift
//  MySpot
//
//  Created by Katalin Neda on 07.11.2021.
//

import SwiftUI

struct CongratulationView: View {
    
    @Binding var showPopup: Bool
    
    @State private var angle: Double = 360.0
    @State private var isAnimating = true
    
    private let onSelectConfirm: (() -> Void)?
    
    init(showPopup: Binding<Bool>, onSelectConfirm: (() -> Void)?) {
        self._showPopup = showPopup
        self.onSelectConfirm = onSelectConfirm
    }
    
    var body: some View {
        ZStack {
            if showPopup {
                Color.white.opacity(0.9).edgesIgnoringSafeArea(.all)
                
                FireworkView()
            
                VStack(alignment: .center) {
                    Spacer()
                    
                    Text("Congratulation!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    Text("You've earned two coins by sharing your parking spot with others.")
                        .frame(alignment: .center)
                        .padding(.bottom)
                        .padding(.top)
                    
                    Image("coin")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .rotation3DEffect(.degrees(angle), axis: (x: 0, y: 1, z: 0))
                        .onAppear(perform: {
                            withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                                self.angle += 360.0
                            }
                        })
                    
                    Button("Collect", action: {
                        withAnimation(.linear(duration: 0.3)) {
                            self.showPopup = false
                            self.onSelectConfirm?()
                        }
                    })
                        .buttonStyle(AccentButtonStyle())
                        .padding()
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity
                        )
                    Spacer()
                }
                .padding()
            }
        }
        
    }
}

struct CongratulationView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationView(showPopup: .constant(true), onSelectConfirm: nil)
    }
}
