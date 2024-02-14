//
//  ProductCardContainerView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 25.01.24.
//

import UIKit
import SnapKit

enum ProductType: String, CaseIterable {
    case tariff = "Tarifler"
    case package = "Paketler"
}
extension ProductType {
    func getTitle() -> String {
        return self.rawValue
    }
    
    func getImage() -> UIImage? {
        switch self {
        case .tariff:
            AppAssets.tarifler.load()
        case .package:
            AppAssets.paketler.load()
        }
    }
}

class ProductCardContainerView: UIView {
    private var productCardCells: [ProductCardCell] = []
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Məhsullar"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupProductCards()
        self.addSubviews()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        productCardCells.forEach { productCardCell in
            contentStackView.addArrangedSubview(productCardCell)
        }
        addSubview(contentStackView)
        
    }
    
//    private func setupProductCards() {
//        ProductType.allCases.forEach { productType in
//            self.productCardCells.append(ProductCardCell(productType: productType))
//        }
//    }

    
    private func setupProductCards() {
        ProductType.allCases.forEach { productType in
            let productCardCell = ProductCardCell(productType: productType)
            productCardCell.layer.cornerRadius = 16
            productCardCell.clipsToBounds = true
            productCardCell.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(80)
            }
            self.productCardCells.append(productCardCell)
        }
    }
    
    private func addConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(80)
        }
        
    }
    
}
