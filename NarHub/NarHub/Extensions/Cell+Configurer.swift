//
//  Cell+Configurer.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 30.01.24.
//

import UIKit

public protocol CellConfigurer: AnyObject {
    static var reuseIdentifier: String {get}
}

public extension CellConfigurer {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellConfigurer { }
