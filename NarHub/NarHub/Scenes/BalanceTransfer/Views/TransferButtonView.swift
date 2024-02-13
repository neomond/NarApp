//
//  TransferButtonView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit
import SnapKit

class TransferButtonView: UIView {
    // MARK: - Properties
    private let transferButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Köçür", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = ColorStyle.mainColor.load()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 28
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        addSubview(transferButton)
    }
    
    private func setupConstraints() {
        transferButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Public Methods
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) {
        transferButton.addTarget(target, action: action, for: event)
    }
}
