//
//  ServiceViewCell.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 11.02.24.
//

import UIKit


class ServiceViewCell: UICollectionViewCell {
    static var reuseIdentifier: String = "ServiceViewCell"

    
    private let serviceLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .black
        return lbl
    }()
    
    let circleView: UIView = {
        let circleView = UIView()
        circleView.layer.cornerRadius = 20
        return circleView
    }()
    
    let serviceImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        return imgView
    }()
    

    fileprivate func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
    }
    
    private func addSubviews() {
        self.circleView.addSubview(self.serviceImageView)
        self.contentView.addSubview(self.circleView)
        self.contentView.addSubview(self.serviceLabel)
    }
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
        self.addSubviews()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
   private func addConstraints() {
       self.serviceImageView.snp.updateConstraints { make in
            make.width.height.equalTo(24)
            make.center.equalTo(circleView)
        }
       self.circleView.snp.updateConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(12)
        }
        
       self.serviceLabel.snp.updateConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(circleView.snp.trailing).offset(8)
            make.trailing.bottom.equalTo(contentView).offset(-12)
            
        }
    }
    
    //MARK: Public
    public func configure(with hubModel: HubModel) {
        self.serviceLabel.text = hubModel.title
        self.serviceImageView.image =  hubModel.image
    }
}
