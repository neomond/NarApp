//
//  MiddleButtonManager.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 05.02.24.
//

import UIKit


class MiddleButtonManager {
    
    static func setupMiddleButton(on tabBar: UITabBar) -> UIButton {
        let middleButton = UIButton()
        middleButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 30, y: -20 + 10, width: 56, height: 56)
        
        middleButton.backgroundColor = UIColor.systemPink
        middleButton.layer.cornerRadius = middleButton.frame.size.height / 2
        middleButton.layer.masksToBounds = false
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.2
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        tabBar.addSubview(middleButton)
        middleButton.layer.zPosition = 1
        tabBar.bringSubviewToFront(middleButton)
        middleButton.setImage(AppAssets.program.load()?.resized(to: CGSize(width: 24, height: 24)), for: .normal)
        middleButton.imageView?.contentMode = .scaleAspectFit
        
        return middleButton
    }
}
