//
//  SpotsView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI
import CoreLocation

struct SpotsView: View {
    
    @State var spots: [Spot] = [Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "1", instuctions: "Nothing", availability: []),
                                Spot(address: "Location", coordinates: Coordinates(latitude: 51.507222, longitude: -0.1275), number: "2", instuctions: "Nothing", availability: [])]
    
    @State private var selectedSpot: Spot?
    @State private var addNewItemIsPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(spots.indices) { index in
                    ZStack {
                        MySpotCard(spot: $spots[index], onSelect: {
                            self.selectedSpot = spots[index]
                        })
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(color: .separator, radius: 6, x: 0, y: 0)
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                        
                        NavigationLink(destination: MySpotView(spot: $spots[index])) {

                        }.buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)

                    }
                }
                .hideRowSeparator()
            }
            .navigationTitle("My Spots")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        addNewItemIsPresented = true
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
        }
        .sheet(isPresented: $addNewItemIsPresented) {
            AddSpotView()
        }
    }
}

struct SpotsView_Previews: PreviewProvider {
    static var previews: some View {
        SpotsView()
    }
}
