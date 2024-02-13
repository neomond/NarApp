//
//  UnlimitedInternetUsageView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 31.01.24.
//

import UIKit
import SnapKit
import NarHubNetworkKit

class UnlimitedInternetUsageView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Paketsiz internet istifadəsi"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var forwardingSwitch: UISwitch = {
        let switchControl = UISwitch()
        return switchControl
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(forwardingSwitch)
        addSubview(descriptionLabel)
        backgroundColor = .white
        layer.cornerRadius = 16
        
        // ::here -> for switch active color
        forwardingSwitch.onTintColor = ColorStyle.mainColor.load()
        
        // ::here -> for line spacing
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        let attributedString = NSMutableAttributedString(
            string: "İstifadə edilən trafikə görə balansdan ödə",
            attributes: [.paragraphStyle: paragraphStyle]
        )
        descriptionLabel.attributedText = attributedString
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        
        forwardingSwitch.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-18)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(140)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

extension UnlimitedInternetUsageView {
    func configureView(with item: VASModel) {
        titleLabel.text = item.title
        descriptionLabel.text = item.desc
        forwardingSwitch.isOn = item.isSwitch
    }
}
