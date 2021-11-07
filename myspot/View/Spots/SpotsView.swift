//
//  SpotsView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI
import CoreLocation

struct SpotsView: View {

    @ObservedObject var spotsService: SpotsService = SpotsService()
    
    @State private var selectedSpot: Spot?
    @State private var addNewItemIsPresented: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(spotsService.spots, id: \.id) { spot in
                        NavigationLink(destination: MySpotView(spot: getSpot(for: spot))) {
                            MySpotCard(spot: getSpot(for: spot), onSelect: {
                                self.selectedSpot = spot
                            })
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: .separator, radius: 6, x: 0, y: 0)
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                        }
                    }
                }
                .padding([.leading, .trailing], 16)
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
            AddSpotView { spot in
                spotsService.spots.append(spot)
            }
        }
    }
    
    private func getSpot(for spot: Spot) -> Binding<Spot> {
        guard let index = spotsService.spots.firstIndex(where: { $0.id == spot.id } ) else {
            fatalError("No spot")
        }
        
        return $spotsService.spots[index]
    }
}

struct SpotsView_Previews: PreviewProvider {
    static var previews: some View {
        SpotsView()
    }
}
