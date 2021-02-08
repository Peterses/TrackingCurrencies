//
//  TextField+extension.swift
//  TrackingCurrency
//
//  Created by Peterses on 08/02/2021.
//

import UIKit

extension UITextField {
    func addToolbar() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(clickedDone))
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceBtn, done], animated: true)
        self.inputAccessoryView = toolbar
    }

    @objc func clickedDone() {
        self.endEditing(true)
    }
}
