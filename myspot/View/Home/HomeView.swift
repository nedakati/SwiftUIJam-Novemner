//
//  HomeView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct HomeView: View {
    @State private var showsEarnCoins = false
    @State private var selectedSpot: AnnotatedItem?
    
    private var pointsOfInterest = [
        AnnotatedItem(name: "Lidl", coordinate: .init(latitude: 46.777412, longitude: 23.608454)),
        AnnotatedItem(name: "Marasti", coordinate: .init(latitude: 46.776219, longitude: 23.606732)),
        AnnotatedItem(name: "Top Wash", coordinate: .init(latitude: 46.776327, longitude: 23.608778))
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            FindSpotMap(selectedSpot: $selectedSpot)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading) {
                coinsView
                    .padding()
                
                Spacer()
                
                CurrentBookingCard()
                    .padding()
            }
        }
        .sheet(isPresented: $showsEarnCoins, content: EarnCoinsView.init)
//        .sheet(isPresented: .constant(true), onDismiss: nil, content: ReserveView.init)
    }
    
    private var coinsView: some View {
        Button(action: { showsEarnCoins = true }) {
            Label("24", image: "ic_coin")
                .foregroundColor(.primary)
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .background(Color.systemBackground)
            .cornerRadius(16)
        }
        .accessibilityValue("24 coins")
        .accessibilityHint("Tap to learn how to earn coins.")
    }
}

struct CurrentBookingCard: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Your reservation")
                .font(.title3)
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
                        .font(.title)
                }
            }
            .padding([.horizontal], 12)

            Button("End reservation", action: {})
                .padding([.horizontal, .bottom], 12)
                .buttonStyle(AccentButtonStyle())
        }
        .background(Color.systemBackground)
        .cornerRadius(12)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
