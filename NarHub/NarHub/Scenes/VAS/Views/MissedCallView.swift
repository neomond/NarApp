//
//  MissedCallView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 31.01.24.
//

import UIKit
import SnapKit
import NarHubNetworkKit

class MissedCallView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Buraxılmış zəng"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Sizə zəng etməyə çalışanları şəbəkəyə qayıtmağınız barədə məlumatlandırın."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subscriptionInfoLabel: UILabel = {
        let label = UILabel()
        let mainText = "30 günlük "
        let grayText = "/ 0,10 ₼"
        let mainTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ]
        
        let grayTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: ColorStyle.labelColor.load() as Any
        ]
        let attributedString = NSMutableAttributedString(string: mainText, attributes: mainTextAttributes)
        let grayAttributedString = NSAttributedString(string: grayText, attributes: grayTextAttributes)
        
        attributedString.append(grayAttributedString)
        
        label.attributedText = attributedString
        
        return label
    }()
    
    
    private lazy var serviceSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.onTintColor = ColorStyle.mainColor.load()
        return switchControl
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
        addSubview(subscriptionInfoLabel)
        addSubview(serviceSwitch)
        addSubview(infoLabel)
        backgroundColor = .white
        layer.cornerRadius = 16
        
        // ::here -> for line spacing
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        let attributedString = NSMutableAttributedString(
            string: "Sizə zəng etməyə çalışanları şəbəkə qayıtmağınız barədə məlumatlandırın.",
            attributes: [ .paragraphStyle: paragraphStyle ]
        )
        infoLabel.attributedText = attributedString
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        
        subscriptionInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-24)
        }
        
        serviceSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(subscriptionInfoLabel.snp.centerY)
            make.right.equalToSuperview().offset(-16)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            
        }
    }
    
}

extension MissedCallView {
    func configureView(with item: VASModel) {
        titleLabel.text = item.title
        infoLabel.text = item.desc
        subscriptionInfoLabel.text = "\(item.amountMonthly) / \(item.amount) ₼"
        serviceSwitch.isOn = item.isSwitch
    }
}
