
//  StoryCircleCollectionViewCell.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//

import UIKit
import SnapKit

class StoryCircleCell: UICollectionViewCell {
    static var reuseIdentifier: String = "StoryCircleCell"
    
    private let highlightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 36
        return imageView
    }()
    
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(named: ColorStyle.mainColor.rawValue)!.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 40
        return view
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.addConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    private func addConstraints() {
        self.circleView.snp.updateConstraints { make in
            make.width.height.equalTo(80)
        }
        self.highlightImageView.snp.updateConstraints { make in
            make.width.height.equalTo(72)
            make.centerY.equalTo(circleView.snp.centerY)
            make.centerX.equalTo(circleView.snp.centerX)
        }
    }
    
    private func addSubviews() {
        self.addSubview(circleView)
        self.circleView.addSubview(highlightImageView)
    }
    
    
    //MARK: Public
    
    public func configure(storyModel: StoryModel) {
        let url = URL(string: storyModel.url)
        self.highlightImageView.sd_setImage(with: url)
        self.circleView.layer.borderColor = storyModel.isSeen ? UIColor(named: ColorStyle.labelColor.rawValue)!.cgColor : UIColor(named: ColorStyle.mainColor.rawValue)!.cgColor
    }
}
