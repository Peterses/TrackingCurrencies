//
//  ViewController.swift
//  TrackingCurrency
//
//  Created by Peterses on 07/02/2021.
//

import UIKit


class ViewController: UIViewController, Storyboarded {
    	
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    weak var coordinator: MainCoordinator?
    var viewModel = CurrencyViewModel()
    var symbols: [String] = []
    var rates: [Double] = []
    private var pickerViewBase = UIPickerView()
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.deselectSelectedRow(animated: true)
    }
    
    private func setupDelegatesAndDataSources() {
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        pickerViewBase.delegate = self
        pickerViewBase.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegatesAndDataSources()
        viewModel.sendLatestCurrencies(base: "PLN")
        textField.text = "PLN"
        textField.inputView = pickerViewBase
        textField.addToolbar()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return symbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier) as? CurrencyTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(symbol: symbols[indexPath.row], rate:
                        String(rates[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.currenciesHistory(of: textField.text ?? "PLN", symbol: symbols[indexPath.row])
    }
}

extension ViewController: ViewControllerDelegate {
    func getCurrenciesBack(symbols: [String], rates: [Double]) {
        self.symbols = symbols
        self.rates = rates
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.pickerViewBase.reloadAllComponents()
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return symbols.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return symbols[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = symbols[row]
        viewModel.sendLatestCurrencies(base: symbols[row])
    }
}
