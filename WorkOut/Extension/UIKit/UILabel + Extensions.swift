//
//  UILabel + Extensions.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 23.02.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
        self.font = .robotoMedium14()
        self.textColor = .specialBrown
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
