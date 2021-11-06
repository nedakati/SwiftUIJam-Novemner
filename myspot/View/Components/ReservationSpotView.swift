//
//  ReservationSpotView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI

private let timeFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .short
    return dateFormatter
}()

struct ReservationSpotView: View {
    
    let reservation: ReservationRange
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(Color("ReservationBorder"))
                .offset(x: 6, y: -6)
            
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(Color("ReservationBorder"))
                .offset(x: 278, y: 44)
            
            Color("ReservationFill")
                .cornerRadius(6)
            
            Text("\(timeFormatter.string(from: reservation.startDate)) - \(timeFormatter.string(from: reservation.endDate))")
                .padding([.leading, .top], 6)
                .foregroundColor(.white)
                .font(.system(.footnote, design: .monospaced))
        }
        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("ReservationBorder"), lineWidth: 2))
        .padding(.leading, 60)
        .padding(.horizontal)
    }
}

struct ReservationSpotView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationSpotView(reservation: ReservationRange(startDate: Date(), endDate: Date().advanced(by: 360)))
    }
}
