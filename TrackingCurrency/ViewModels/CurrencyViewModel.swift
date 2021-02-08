//
//  CurrencyCellViewModel.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import Foundation


class CurrencyViewModel: ViewModelDelegate {
    
    var symbols: [String] = []
    var rates: [Double] = []
    

    weak var delegate: ViewControllerDelegate?

    func sendLatestCurrencies(base: String) {
        symbols = []
        rates = []
        Webservices().getLatestCurrencies(url: URL(string: URLConstants.getLatestCurrencies+"?base=\(base)")!) { (currency) in
            guard let currency = currency else {
                print("No latest currencies get from API!")
                return
            }
            
            let sortedYourArray = currency.rates.sorted( by: { $0.0 < $1.0 })
            
            for (key, value) in sortedYourArray {
                self.symbols.append(key)
                self.rates.append(Double(round(10000*(1/value))/10000))
            }
            self.delegate?.getCurrenciesBack(symbols: self.symbols, rates: self.rates)
        }
    }
}
