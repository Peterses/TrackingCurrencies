//
//  CurrencyPeriodViewModelDelegate.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import Foundation

protocol CurrencyPeriodViewModelDelegate {
    func sendPeriodCurrencies(base: String, symbol: String, currentDate: String)
}
