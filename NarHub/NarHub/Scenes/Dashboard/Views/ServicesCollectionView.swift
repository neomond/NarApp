//
//  ServicesCollectionView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 11.02.24.
//

import UIKit

class ServicesCollectionView: UICollectionView {
    
    //MARK: Init
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: ( UIScreen.main.bounds.width - 40 ) / 2, height: 66)
        super.init(frame: .zero, collectionViewLayout: layout)

        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
