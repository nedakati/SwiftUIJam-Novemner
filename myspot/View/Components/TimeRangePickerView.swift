//
//  TimeRangePicker.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI

private let textWidth: CGFloat = 60

struct TimeRangePickerView: View {
    @State private var reservation: ReservationRange?
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false

    
    var body: some View {
        
        let dragGesture = DragGesture()
                    .onChanged { value in self.offset = value.translation }
                    .onEnded { _ in
                        withAnimation {
                            self.offset = .zero
                            self.isDragging = false
                        }
                    }

                // a long press gesture that enables isDragging
                let pressGesture = LongPressGesture()
                    .onEnded { value in
                        withAnimation {
                            self.isDragging = true
                        }
                    }

                // a combined gesture that forces the user to long press then drag
                let combined = pressGesture.sequenced(before: dragGesture)

        ScrollView(showsIndicators: false) {
            ZStack(alignment: .top) {
                backgroundGridView
                
                if let reservation = reservation {
                    ReservationSpotView(reservation: reservation)
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity
                        )
                        .frame(height: 50)
                        .offset(x: 0, y: CGFloat(reservation.startDate.hours) * 50 + 25)
                        .scaleEffect(isDragging ? 1.1 : 1)
                        .gesture(combined)
                }
            }
        }
    }
    
    private var backgroundGridView: some View {
        VStack(spacing: 0) {
            ForEach(0...24, id: \.self) { index in
                HStack {
                    Text(String(format: "%.2d:00", index))
                        .font(.caption)
                        .frame(width: textWidth)
                        .foregroundColor(.secondary)
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color("separator"))
                }
                .frame(height: 50)
                .contentShape(Rectangle())
                .onTapGesture {
                    reserveFromHour(index)
                }
            }
        }
    }
    
    // MARK: - Actions
    
    private func reserveFromHour(_ hour: Int) {
        withAnimation {
            reservation = ReservationRange(startDate: Date().settingHour(hour), endDate: Date().settingHour(hour + 1))
        }
    }
}

#if DEBUG
struct TimeRangePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeRangePickerView()
    }
}
#endif
