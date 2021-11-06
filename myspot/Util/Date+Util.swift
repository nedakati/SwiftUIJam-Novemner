//
//  Date+Util.swift
//  MySpot
//
//  Created by Botond Magyarosi on 05.11.2021.
//

import Foundation

extension Date {
    
    var hours: Int {
        Calendar.current.component(.hour, from: self)
    }
    
    func settingHour(_ hour: Int, minute: Int = 0) -> Date {
        Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: self)!
    }
}
