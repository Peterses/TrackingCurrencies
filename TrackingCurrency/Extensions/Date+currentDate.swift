//
//  Date+extension.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import Foundation

extension Date {

 static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
}
