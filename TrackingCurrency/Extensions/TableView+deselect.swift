//
//  TableView+deselect.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import Foundation
import UIKit

extension UITableView {

    func deselectSelectedRow(animated: Bool)
    {
        if let indexPathForSelectedRow = self.indexPathForSelectedRow {
            self.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }

}
