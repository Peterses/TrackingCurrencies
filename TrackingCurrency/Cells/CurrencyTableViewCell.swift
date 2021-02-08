//
//  CurrencyTableViewCell.swift
//  TrackingCurrency
//
//  Created by Peterses on 07/02/2021.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    static let identifier = "CurrencyTableViewCellIdentifier"
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(symbol: String, rate: String) {
        symbolLabel.text = symbol
        rateLabel.text = rate
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
