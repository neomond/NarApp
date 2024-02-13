//
//  TabBarView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

// TabBarView.swift



import UIKit

protocol TabBarViewDelegate: AnyObject {
}

final class TabBarView: UIView {
    
    weak var delegate: TabBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func setupCustomTabBarShape(for tabBar: UITabBar) {
        let path = getPathForTabBar(tabBar: tabBar)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        tabBar.layer.insertSublayer(shape, at: 0)
    }
    
    private static func getPathForTabBar(tabBar: UITabBar) -> UIBezierPath {
        let frameWidth = tabBar.bounds.width
        let frameHeight = tabBar.bounds.height + 40
        let holeWidth = CGFloat(150)
        let holeHeight = CGFloat(60)
        let leftXUntilHole = (frameWidth / 2) - (holeWidth / 2)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: leftXUntilHole, y: 0)) // Start to left hole
        path.addCurve(to: CGPoint(x: leftXUntilHole + (holeWidth / 3), y: holeHeight / 2),
                      controlPoint1: CGPoint(x: leftXUntilHole + ((holeWidth / 3) / 8) * 6, y: 0),
                      controlPoint2: CGPoint(x: leftXUntilHole + ((holeWidth / 3) / 8) * 8, y: holeHeight / 2)) // Curve left
        path.addCurve(to: CGPoint(x: leftXUntilHole + (2 * holeWidth) / 3, y: holeHeight / 2),
                      controlPoint1: CGPoint(x: leftXUntilHole + (holeWidth / 3) + (holeWidth / 3) / 3 * 2 / 5, y: (holeHeight / 2) * 6 / 4),
                      controlPoint2: CGPoint(x: leftXUntilHole + (holeWidth / 3) + (holeWidth / 3) / 3 * 2 + (holeWidth / 3) / 3 * 3 / 5, y: (holeHeight / 2) * 6 / 4)) // Curve middle
        path.addCurve(to: CGPoint(x: leftXUntilHole + holeWidth, y: 0),
                      controlPoint1: CGPoint(x: leftXUntilHole + (2 * holeWidth) / 3, y: holeHeight / 2),
                      controlPoint2: CGPoint(x: leftXUntilHole + (2 * holeWidth) / 3 + (holeWidth / 3) * 2 / 8, y: 0)) // Curve right
        path.addLine(to: CGPoint(x: frameWidth, y: 0)) // Right hole to end
        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight)) // Down
        path.addLine(to: CGPoint(x: 0, y: frameHeight)) // Left
        path.close()
        
        return path
    }
    
}
