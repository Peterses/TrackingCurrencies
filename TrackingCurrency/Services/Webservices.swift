//
//  Webservice.swift
//  TrackingCurrency
//
//  Created by Peterses on 07/02/2021.
//

import Foundation

final class Webservices {

    func getLatestCurrencies(url: URL, completion: @escaping (Currency?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let currency = try? JSONDecoder().decode(Currency.self, from: data)
                completion(currency)
            }
        }.resume()
    }
    
    func getCurrenciesByPeriod(url: URL, completion: @escaping (CurrencyPeriod?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let currency = try? JSONDecoder().decode(CurrencyPeriod.self, from: data)
                completion(currency)
            }
        }.resume()
    }
}
