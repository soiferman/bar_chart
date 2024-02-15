//
//  Date+ext.swift
//  Bar Chart
//
//  Created by Max Soiferman on 14/2/24.
//

import Foundation

extension Date {
    
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
    
}
