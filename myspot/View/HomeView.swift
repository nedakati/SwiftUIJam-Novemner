//
//  HomeView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $region, showsUserLocation: true)
                .edgesIgnoringSafeArea(.all)
            
            CurrentBookingCard()
                .padding()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

struct CurrentBookingCard: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Your reservation")
                .font(.headline)
                .padding([.horizontal, .top], 8)
            HStack {
                Image("spot")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaledToFill()
                    .clipped()
                    .cornerRadius(8)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Strada Tășnad 25")
                    Label("25 minutes remaining", systemImage: "clock")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                }
                .padding(.trailing)
            }
            .padding([.horizontal], 8)

            Button("End reservation", action: {})
                .padding([.horizontal, .bottom], 8)
        }
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
