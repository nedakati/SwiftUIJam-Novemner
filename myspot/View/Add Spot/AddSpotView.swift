//
//  AddSpotView.swift
//  MySpot
//
//  Created by Katalin Neda on 06.11.2021.
//

import SwiftUI
import MapKit

struct AddSpotView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject private var manager = LocationManager()

    @State private var address: String = ""
    @State private var number: String = ""
    @State private var instructions: String = ""
    @State private var coordinates: Coordinates = Coordinates(latitude: 0, longitude: 0)
    
    private let onSpotCreated: ((Spot) -> Void)?

    init(onSpotCreated: ((Spot) -> Void)?) {
        self.onSpotCreated = onSpotCreated
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24) {
                AddSpotMap(onLocationSelected: { location in
                    self.address = location.address
                    self.coordinates = location.coordinte
                })
                    .cornerRadius(16)
                    .frame(height: 200)
                
                VStack(alignment: .leading, spacing:4) {
                    Text("Change address")
                        .font(.callout)
                        .foregroundColor(.gray)
                    TextField("Address", text: $address)
                        .underlineTextField()
                }
                
                VStack(alignment: .leading, spacing:4) {
                    Text("Change parking space number")
                        .font(.callout)
                        .foregroundColor(.gray)
                    TextField("Number", text: $number)
                        .underlineTextField()
                }
                
                VStack(alignment: .leading, spacing:4) {
                    Text("Change instrunctions")
                        .font(.callout)
                        .foregroundColor(.gray)
                    TextField("Instructions", text: $instructions)
                        .underlineTextField()
                }
                
                Spacer()

                Button("Save", action: {
                    saveNewSpot()
                })
                    .buttonStyle(AccentButtonStyle())
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
            }
            .padding()
            .navigationTitle("Add new spot")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
        }
    }
    
    // MARK: - Private methods
    
    private func saveNewSpot() {
        let spot = Spot(address: address,
                        coordinates: coordinates,
                        number: number,
                        instuctions: instructions)
        onSpotCreated?(spot)
        
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddSpotView_Previews: PreviewProvider {
    static var previews: some View {
        AddSpotView(onSpotCreated: nil)
    }
}
