//
//  ReserveView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI

struct ReserveView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let spot: Spot
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    Text("Reserve the spot")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text(spot.address)
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
            
            TimeRangePickerView(availability: spot.availability)
            
            Button("Reserve my spot", action: {})
                .buttonStyle(AccentButtonStyle())
                .padding()
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
        }
    }
}

struct ReserveView_Previews: PreviewProvider {
    
    static var previews: some View {
        let spot = Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing")
        return ReserveView(spot: spot)
    }
}
