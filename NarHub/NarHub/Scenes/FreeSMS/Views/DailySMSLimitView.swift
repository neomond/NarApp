//
//  DailySMSLimitView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 30.01.24.
//

import UIKit
import SnapKit

class DailySMSLimitView: UIView {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var networkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = ColorStyle.labelColor.load()
        return label
    }()
    
    lazy var smsCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(containerView)
        addSubview(activityIndicator)
        bringSubviewToFront(activityIndicator)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(networkLabel)
        containerView.addSubview(smsCountLabel)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(16)
        }
        
        networkLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(16)
        }
        
        smsCountLabel.snp.makeConstraints { make in
            make.top.equalTo(networkLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.startAnimating()
    }
    
    public func configure(with model: DailyFreeSMSModel) {
        self.titleLabel.text = model.title
        self.networkLabel.text = model.desc
        self.smsCountLabel.text = model.smsCount
        activityIndicator.stopAnimating()
    }
}

