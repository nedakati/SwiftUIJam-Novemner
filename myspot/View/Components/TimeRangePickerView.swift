//
//  TimeRangePicker.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI

private let textWidth: CGFloat = 60

struct TimeRangePickerView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                VStack {
                    ForEach(0...24, id: \.self) { i in
                        HStack {
                            Text(String(format: "%.2d:00", i))
                                .font(.caption)
                                .frame(width: textWidth)
                            Rectangle()
                                .frame(height: 0.5)
                        }
                        .foregroundColor(.secondary)
                        .frame(height: 50)
                        .onTapGesture {
                            print("tap")
                        }
                    }
                }
                
                ZStack(alignment: .topLeading) {
                    Color.accentColor
                        .opacity(0.8)
                        .cornerRadius(6)
                    Text("10:00 - 11:30")
                        .padding([.leading, .top], 4)
                        .foregroundColor(.white)
                        .font(.footnote)
                }
                .padding(.leading, textWidth)
                .padding(.horizontal)
                .frame(width: .infinity, height: 50)
            }
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
