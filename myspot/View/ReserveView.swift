//
//  ReserveView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI

struct ReserveView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    Text("Reserve the spot")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text("101-165 W 20th St")
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
        ReserveView()
    }
}
