//
//  Currency.swift
//  TrackingCurrency
//
//  Created by Peterses on 07/02/2021.
//

import Foundation


struct Currency: Decodable {
    let base: String
    let date: String
    let rates: Dictionary<String, Double>
}


struct CurrencyPeriod: Codable {
    var base: String
    var startAt: String
    var endAt: String?
    var rates: Dictionary<String, Dictionary<String, Double>>
    
    enum CodingKeys: String, CodingKey {
        case base
        case startAt = "start_at"
        case endAt = "end_at"
        case rates
    }
}
