//
//  CurrencyPeriodTableViewCell.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import UIKit

class CurrencyPeriodTableViewCell: UITableViewCell {

    static let idientifier = "CurrencyPeriodTableViewCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(date: String, rate: String) {
        dateLabel.text = date
        rateLabel.text = rate
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
