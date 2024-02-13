//
//  Colors.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 24.01.24.
//

import UIKit

public enum ColorStyle: String, CaseIterable {
    case mainColor = "MainColor"
    case labelColor = "LabelColor"
    case dataLabel = "DataLabel"
    case black =  "BlackColor"
    case bgColor = "BgColor"
    case serviceBgColor = "ServiceBg"
    case activeBtnBgColor = "activeBtnBgColor"
    case graySecondary = "GraySecondary"
    case btnActive = "btnActive"
}

extension ColorStyle {
    func load() -> UIColor? {
        if #available(iOS 13.0, *) {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: .current)
        } else {
            return UIColor(named: self.rawValue, in: bundle, compatibleWith: nil)
        }
    }
}
