//
//  ViewController+Navigation.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//

import UIKit

extension UIViewController {
    
    private struct AssociatedKeys {
        static var showBackButton = "ShowBackButton"
    }

    var showBackButton: Bool {
        get {
            guard let number = objc_getAssociatedObject(self, &AssociatedKeys.showBackButton) as? NSNumber else {
                return true
            }
            return number.boolValue
        }

        set(value) {
            objc_setAssociatedObject(self,&AssociatedKeys.showBackButton,NSNumber(value: value),objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if value {
                self.addBackButton()
            } else {
                self.removeBackButton()
            }
        }
    }
    
    // MARK: - Private
    
    private func addBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage.add,
            style: .plain,
            target: self,
            action: #selector(popToPrevious)
        )
    }
    
    private func removeBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem()
    }
    
    // MARK: - Selectors
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func notificationButtonAction() { }
    
    
    // MARK: - Public
    
    func popVC() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func popToRoot() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    func popBack(_ nb: Int) {
        if let viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            guard viewControllers.count < nb else {
                self.navigationController?.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
                return
            }
        }
    }
    
    func popBack<T: UIViewController>(toControllerType: T.Type) {
        if var viewControllers: [UIViewController] = self.navigationController?.viewControllers {
            viewControllers = viewControllers.reversed()
            for currentViewController in viewControllers {
                if currentViewController .isKind(of: toControllerType) {
                    self.navigationController?.popToViewController(currentViewController, animated: true)
                    break
                }
            }
        }
    }
}
