//
//  FreeSMSView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

protocol FreeSMSViewDelegate: AnyObject {
}

final class FreeSMSView: UIView {
    
    weak var delegate: FreeSMSViewDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Mesaj"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var sendBtnView = FreeSMSBtnView()
    lazy var dailySMSLimitView = DailySMSLimitView()
    private lazy var contactManagerView = ContactManagerView()
    private lazy var msgInputView = MessageInputView()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = ColorStyle.serviceBgColor.load()
        addSubviews()
        addConstraints()
        configureContactManagerView()
    }
    
    private func configureContactManagerView() {
        contactManagerView.configure(withTitle: "Kimə", placeholder: "", contactImage: UIImage(named: "contacts_book")!)
        contactManagerView.delegate = self
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(messageLabel)
        contentView.addSubview(contactManagerView)
        
        contentView.addSubview(dailySMSLimitView)
        contentView.addSubview(msgInputView)
        contentView.addSubview(sendBtnView)
    }
    
    
    
    private func addConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(self)
            make.bottom.equalTo(sendBtnView.snp.bottom)
        }
        dailySMSLimitView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(16)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(dailySMSLimitView.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(16)
        }
        contactManagerView.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        msgInputView.snp.makeConstraints { make in
            make.top.equalTo(contactManagerView.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
        }
        sendBtnView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.height.equalTo(56)
        }
        
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
}

extension FreeSMSView: ContactManagerViewDelegate {
    func didTapContactsButton() {
    }
    
    func didEndEditingPhoneNumber(with number: String?) {
    }
    
    func didValidatePhoneNumber(isValid: Bool) {
    }
}
