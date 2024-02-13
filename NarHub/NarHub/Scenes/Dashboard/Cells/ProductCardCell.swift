//
//  ProductCardCell.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 25.01.24.
//

import UIKit
import SnapKit

class ProductCardCell: UICollectionViewCell {
    let productType: ProductType
    static let reuseIdentifier = "ProductCardCell"
    
    
    // MARK: - View Components
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private lazy var imageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    init(productType: ProductType) {
        self.productType = productType
        super.init(frame: .zero)
        setupViews()
        updateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    private func setupViews() {
        self.titleLabel.text = productType.getTitle()
        self.imageView.image = productType.getImage()
        
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(imageView)
    }
    
    
    // MARK: - Update View
    override func updateConstraints() {
        super.updateConstraints()
        containerView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.updateConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(12)
            make.right.equalTo(imageView.snp.left).offset(-8)
            make.left.equalTo(containerView.snp.left).offset(12)
        }
        imageView.snp.updateConstraints { make in
            make.centerY.equalTo(containerView.snp.centerY)
            make.right.equalTo(containerView.snp.right).offset(-8)
            make.height.width.equalTo(80)
        }
    }
}
