//
//  ServicesGridView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 25.01.24.
//

import UIKit
import SnapKit

enum ServiceType: String, CaseIterable {
    
    case credit = "Kredit"
    case freeSMS = "Free SMS"
    case balanceTransfer = "Balance transfer"
    case cevirOffer = "'Çevir' offer"
    case servicesAbroad = "Əlavə dəyər xidmətləri"
    
    func getTitle() -> String {
        return self.rawValue
    }
    
    func getImage() -> UIImage? {
        switch self {
        case .credit:
            AppAssets.credit.load()
        case .freeSMS:
            AppAssets.sms.load()
            
        case .balanceTransfer:
            AppAssets.balance_transfer.load()
        case .cevirOffer:
            AppAssets.exchange.load()
        case .servicesAbroad:
            AppAssets.vas.load()
        }
    }
}

class ServicesView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Xidmətlər"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var servicesCollectionView: ServicesCollectionView = {
        let collectionView = ServicesCollectionView()
        collectionView.register(ServiceViewCell.self, forCellWithReuseIdentifier: ServiceViewCell.reuseIdentifier)
        collectionView.isHidden = true
        return collectionView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.isHidden = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
       fatalError()

    }
    
    private func setupViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.servicesCollectionView)
        self.addSubview(self.activityIndicator)
       
    }
    
    private func setupConstraints() {
        self.titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        self.servicesCollectionView.snp.updateConstraints({ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.equalTo(serviceViewCollectionHeight)
        })
        
        self.activityIndicator.snp.updateConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    
    
    private var serviceViewCollectionHeight: Int {
        let totalHeight = UIScreen.main.bounds.height * 0.86 - 450
        return Int(totalHeight)
    }

    //MARK: public
    public func startLoading() {
        self.activityIndicator.startAnimating()
    }
    public func stopLoading() {
        self.activityIndicator.stopAnimating()
        self.servicesCollectionView.isHidden = false
    }
}



