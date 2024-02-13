//
//  BalanceTransferView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit


final class BalanceTransferView: UIView {
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
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Xidmətdən gün ərzində 10 dəfə istifadə etmək olar. Hər bir sorğunun dəyəri 0.10 AZN təşkil edir."
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var contactManagerView = ContactManagerView()
    
    private lazy var transferButtonView = TransferButtonView()
    private lazy var transferredAmountView = TransferredAmountView()
    private lazy var serviceDescriptionView = ServiceDescriptionView()
    
    private func setupUI() {
        self.backgroundColor = ColorStyle.serviceBgColor.load()
        addSubviews()
        addConstraints()
        configureContactManagerView()
    }
    
    private func configureContactManagerView() {
         contactManagerView.configure(withTitle: "Mobil nömrə", placeholder: "", contactImage: UIImage(named: "contacts_book")!)
        
     }
    
//    MARK: Update TA
    func updateTransferredAmounts(_ amounts: [String]) {
           transferredAmountView.updateAmounts(amounts)
       }
    
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(contactManagerView)
        contentView.addSubview(transferredAmountView)
        contentView.addSubview(serviceDescriptionView)
        contentView.addSubview(infoLabel)
        contentView.addSubview(transferButtonView)
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
        contactManagerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        infoLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(transferButtonView.snp.top).offset(-16)
        }
        transferButtonView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.height.equalTo(56)
        }
        transferredAmountView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(contactManagerView.snp.bottom).offset(16)
        }
        serviceDescriptionView.snp.makeConstraints { make in
            make.top.equalTo(transferredAmountView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    // This will layout your subviews correctly
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.contentSize = CGSize(width: contentView.frame.width, height: contentView.frame.height)
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
