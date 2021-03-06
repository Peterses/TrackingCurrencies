//
//  Coordinator.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
