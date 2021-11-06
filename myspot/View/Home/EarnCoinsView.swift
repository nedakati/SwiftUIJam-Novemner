//
//  EarnCoinsView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 06.11.2021.
//

import SwiftUI

struct EarnCoinsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Image("illustration_parking")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                    .accessibilityHidden(true)
                
                VStack(alignment: .leading) {
                    Text("You can earn coins by sharing your parking spot with others.")
                        .padding(.bottom)
                    
                    Text("Lend your spot")
                        .fontWeight(.bold)
                    Text("After each hour you lend your spot to someone else you earn 2 coins.")
                        .padding(.bottom)
                    
                    Text("Invite a friend")
                        .fontWeight(.bold)
                    Text("Invite a friend and after their first parking you both get 2 coins.")
                    Button("Invite a friend", action: { })
                        .buttonStyle(AccentButtonStyle())
                        
                    Spacer()
                }
                .padding()
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .navigationTitle("Earn Coins")
        }
    }
}

struct EarnCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        EarnCoinsView()
    }
}
