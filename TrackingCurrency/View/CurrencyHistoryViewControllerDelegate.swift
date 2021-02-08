//
//  CurrencyHistoryViewControllerDelegate.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import Foundation

protocol CurrencyHistoryViewControllerDelegate: class {
    
    func getCurrenciesBack(dates: [String], rates: [Double])
}
