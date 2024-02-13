//
//  FreeSMSBtnView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 30.01.24.
//


import UIKit
import SnapKit

class FreeSMSBtnView: UIView {
    // MARK: - Properties
    private let sendBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Göndər", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = ColorStyle.graySecondary.load()
        button.setTitleColor(ColorStyle.labelColor.load(), for: .normal)
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
        addSubview(sendBtn)
    }
    
    private func setupConstraints() {
        sendBtn.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Public Methods
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) {
        sendBtn.addTarget(target, action: action, for: event)
    }
}

