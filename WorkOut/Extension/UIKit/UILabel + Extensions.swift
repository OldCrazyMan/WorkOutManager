//
//  UILabel + Extensions.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 23.02.2022.
//

import UIKit

extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
        self.font = .robotoMedium14()
        self.textColor = .specialBrown
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
