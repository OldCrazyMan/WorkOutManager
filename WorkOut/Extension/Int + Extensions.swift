//
//  Int + Extensions.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 10.03.2022.
//

import Foundation

extension Int {
    
    func convertSecounds() -> (Int, Int) {
        let min = self / 60
        let sec = self % 60
        return (min, sec)
    }
    
    func setZeroForSecounds() -> String {
    return (Double(self) / 10.0 < 1 ? "0\(self)" : "\(self)")
}
}
