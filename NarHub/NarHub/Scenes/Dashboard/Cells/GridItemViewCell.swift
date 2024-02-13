//
//  GridItemView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 25.01.24.
//

import UIKit
import SnapKit

class GridItemView: UICollectionViewCell {
    static var reuseIdentifier: String = "ServiceViewCell"
    
    // MARK: - Properties
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
     lazy var iconContainerView: UIView = {
        let imgContainer = UIView()
        imgContainer.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        imgContainer.layer.cornerRadius = 20
        imgContainer.clipsToBounds = true
        return imgContainer
    }()
    
     lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Add a public computed property or method to get the service type
    var serviceType: ServiceType? {
        if let title = titleLabel.text {
            return ServiceType(rawValue: title)
        }
        return nil
    }
    
    // MARK: - Setup
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(iconContainerView)
        iconContainerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        iconContainerView.snp.makeConstraints { make in
            make.left.equalTo(containerView.snp.left).inset(12)
            make.bottom.equalTo(containerView.snp.bottom).inset(12)
            make.height.width.equalTo(40)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.edges.equalTo(iconContainerView).inset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconContainerView.snp.right).offset(8)
            make.centerY.equalTo(iconContainerView.snp.centerY)
            make.right.equalTo(containerView.snp.right).inset(12)
        }
    }
    
    
    func configure(with serviceType: ServiceType) {
        titleLabel.text = serviceType.getTitle()
        iconImageView.image = serviceType.getImage()
    }
    
   
}
