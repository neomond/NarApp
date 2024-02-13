//
//  ServiceDescriptionView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

class ServiceDescriptionView: UIView {
    
    private lazy var descriptionContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.graySecondary.load()
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5 
        
        let attributedString = NSAttributedString(
            string: "“Balans köçürmə” xidmətindən istifadə etməklə sən öz balansından istənilən Nar abunəçisinin balansına 0.2, 0.5, 1 və ya 2 AZN məbləğində balans köçürə bilərsən.",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        
        label.attributedText = attributedString
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
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
        addSubview(descriptionContainerView)
        descriptionContainerView.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        descriptionContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalTo(descriptionContainerView).inset(16)
        }
    }
    
}
