//
//  VASView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 28.01.24.
//

import UIKit
import NarHubNetworkKit

final class VASView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var callForwardView: CallForwardingView = {
        let view = CallForwardingView()
        view.isHidden = true
        return view
    }()
    
    lazy var missedCallView: MissedCallView = {
        let view = MissedCallView()
        view.isHidden = true
        return view
    }()
    
    lazy var secretNumberView: SecretNumberView = {
        let view = SecretNumberView()
        view.isHidden = true
        return view
    }()
    
    lazy var unlimitedInternetUsageView: UnlimitedInternetUsageView = {
        let view = UnlimitedInternetUsageView()
        view.isHidden = true
        return view
    }()
    
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.isHidden = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    
    init() {
        super.init(frame: .zero)
        self.setupUI()
        self.addSubviews()
        self.addConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    private func setupUI() {
        self.backgroundColor = ColorStyle.serviceBgColor.load()
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(callForwardView)
        contentView.addSubview(missedCallView)
        contentView.addSubview(secretNumberView)
        contentView.addSubview(unlimitedInternetUsageView)
        contentView.addSubview(self.activityIndicator)
    }
    
    private func addConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(.low)
            // ::here -> contentView will be smaller than the scrollView
        }
        callForwardView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.right.equalToSuperview().inset(16)
        }
        missedCallView.snp.makeConstraints { make in
            make.top.equalTo(callForwardView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
        }
        secretNumberView.snp.makeConstraints { make in
            make.top.equalTo(missedCallView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
        }
        unlimitedInternetUsageView.snp.makeConstraints { make in
            make.top.equalTo(secretNumberView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
        }
        
        activityIndicator.snp.updateConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}

extension VASView {
    func updateView(with items: [VASModel]) {
        if let callForwardingItem = items.first(where: { $0.title == "Zənglərin yönləndirilməsi" }) {
            callForwardView.configureView(with: callForwardingItem)
        }
        if let missedCallItem = items.first(where: { $0.title == "Buraxılmış zəng" }) {
            missedCallView.configureView(with: missedCallItem)
        }
        if let secretNumberItem = items.first(where: { $0.title == "Gizli nömrə" }) {
            secretNumberView.configureView(with: secretNumberItem)
        }
        if let unlimitedInternetUsageItem = items.first(where: { $0.title == "Paketsiz internet istifadəsi" }) {
            unlimitedInternetUsageView.configureView(with: unlimitedInternetUsageItem)
        }
    }
}



