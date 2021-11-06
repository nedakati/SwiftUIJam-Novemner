//
//  MakeSpotAvailable.swift
//  MySpot
//
//  Created by Katalin Neda on 06.11.2021.
//

import SwiftUI

struct MakeSpotAvailable: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var spot: Spot
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    Text("Make Spot Available")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text(spot.location)
                        .foregroundColor(.accentColor)
                        .font(.title2)
                        .fontWeight(.medium)
                }
                Spacer()
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .padding()
            
            TimeRangePickerView()
            
            Button("Confirm", action: {})
                .buttonStyle(AccentButtonStyle())
                .padding()
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
        }
    }
}

struct MakeSpotAvailable_Previews: PreviewProvider {
    static var previews: some View {
        ReserveView()
    }
}
