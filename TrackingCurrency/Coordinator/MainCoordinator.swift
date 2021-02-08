//
//  MainCoordinator.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        vc.title = UIConstants.mainViewTitle
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(vc, animated: false)
    }
    
    func currenciesHistory(of base: String, symbol: String) {
        let vc = CurrencyHistoryViewController.instantiate()
        vc.coordinator = self
        vc.selectedCurrency = base
        vc.selectedSymbol = symbol
        vc.title = UIConstants.historyCurrenciesTitle + ": " + symbol
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(vc, animated: true)
    }
}
