//
//  AmountCollectionViewCell.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 08.02.24.
//

import UIKit


class AmountCollectionViewCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        titleLabel.frame = contentView.bounds
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.cornerRadius = 26
        contentView.clipsToBounds = true
        
        updateAppearance()
    }
    
    override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        titleLabel.text = "\(title) ₼"
    }
    
    private func updateAppearance() {
        print("Updating appearance for isSelected: \(isSelected)")
            if isSelected {
                contentView.backgroundColor = ColorStyle.btnActive.load()
                titleLabel.textColor = ColorStyle.mainColor.load()
                contentView.layer.borderColor = ColorStyle.mainColor.load()?.cgColor
            } else {
                contentView.backgroundColor = .white
                titleLabel.textColor = .black
                contentView.layer.borderWidth = 1
                contentView.layer.borderColor = ColorStyle.graySecondary.load()?.cgColor
            }
        }
}
