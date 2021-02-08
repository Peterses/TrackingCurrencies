//
//  ViewControllerDelegate.swift
//  TrackingCurrency
//
//  Created by Peterses on 07/02/2021.
//

import Foundation


protocol ViewControllerDelegate : class {
    
    func getCurrenciesBack(symbols: [String], rates: [Double])
}
