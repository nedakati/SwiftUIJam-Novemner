//
//  ReserveView.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import SwiftUI

struct ReserveView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Reserve a spot for\nStrada Tășnad 25")
                .font(.title)
                .padding()
            TimeRangePickerView()
        }
    }
}

struct ReserveView_Previews: PreviewProvider {
    static var previews: some View {
        ReserveView()
    }
}
