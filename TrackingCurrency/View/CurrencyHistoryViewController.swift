//
//  CurrencyHistoryViewController.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import Foundation
import UIKit

class CurrencyHistoryViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    var selectedCurrency = ""
    var selectedSymbol = ""
    private var dates: [String] = []
    private var rates: [Double] = []
    
    @IBOutlet weak var historyTableView: UITableView!

    var currencyPeriodViewModel = CurrencyPeriodViewModel()
    
    private func setupDelegatesAndDataSources() {
        currencyPeriodViewModel.delegate = self
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegatesAndDataSources()
        currencyPeriodViewModel.sendPeriodCurrencies(base: selectedCurrency, symbol: selectedSymbol, currentDate: Date.getCurrentDate())
    }
    
}

extension CurrencyHistoryViewController: CurrencyHistoryViewControllerDelegate {
    func getCurrenciesBack(dates: [String], rates: [Double]) {
        self.dates = dates  
        self.rates = rates
        DispatchQueue.main.async {
            self.historyTableView.reloadData()
        }
    }
}

extension CurrencyHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.historyTableView.dequeueReusableCell(withIdentifier: CurrencyPeriodTableViewCell.idientifier) as? CurrencyPeriodTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(date: dates[indexPath.row], rate: String(rates[indexPath.row]))
        return cell
    }

}
