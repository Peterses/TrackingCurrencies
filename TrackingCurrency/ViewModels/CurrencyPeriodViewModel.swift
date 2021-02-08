//
//  CurrencyPeriodViewModel.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import Foundation

class CurrencyPeriodViewModel: CurrencyPeriodViewModelDelegate {

    var dates: [String] = []
    var rates: [Double] = []
    
    weak var delegate: CurrencyHistoryViewControllerDelegate?
    
    func sendPeriodCurrencies(base: String, symbol: String, currentDate: String) {
        Webservices().getCurrenciesByPeriod(url: URL(string: URLConstants.getHistoryCurrencies+"?base=\(base)&start_at=2021-01-25&end_at=\(currentDate)&symbols=\(symbol)")!) { (periodCurrencies) in
            guard let periodCurrencies = periodCurrencies else {
                print("No period currencies get from API!")
                return
            }
            
            let sortedYourArray = periodCurrencies.rates.sorted( by: { $0.0 > $1.0 })
            
            for (key, value) in sortedYourArray {
                self.dates.append(key)
                if let rate = value[symbol] {
                    let rounded = Double(round(10000*(1/rate))/10000)
                    self.rates.append(rounded)
                }

            }

            self.delegate?.getCurrenciesBack(dates: self.dates, rates: self.rates)
        }
    }
}
