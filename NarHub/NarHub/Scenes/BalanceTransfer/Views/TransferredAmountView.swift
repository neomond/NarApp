//
//  TransferredAmount.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 29.01.24.
//

import UIKit

class TransferredAmountView: UIView {
    private var amounts: [String] = []
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Köçürüləcək məbləğ"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    
    private let activityIndicator: UIActivityIndicatorView = {
         let indicator = UIActivityIndicatorView(style: .medium)
         indicator.hidesWhenStopped = true
         return indicator
     }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        addSubview(activityIndicator)
        bringSubviewToFront(activityIndicator)
        
        addSubview(titleLabel)
        addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
        collectionView.register(AmountCollectionViewCell.self, forCellWithReuseIdentifier: "AmountCell")
        
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(23)
            make.left.right.equalToSuperview()
            make.height.equalTo(56)
            make.bottom.lessThanOrEqualToSuperview().inset(16)
        }
        activityIndicator.snp.makeConstraints { make in
                   make.center.equalToSuperview()
               }
        activityIndicator.startAnimating()
    }
    
    
    
    // MARK: load amount view
    func updateAmounts(_ amounts: [String]) {
        self.amounts = amounts
        collectionView.reloadData()
        activityIndicator.stopAnimating()
        
        let initialIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: initialIndexPath, animated: true, scrollPosition: [])
        collectionView.delegate?.collectionView?(collectionView, didSelectItemAt: initialIndexPath)
    }}


extension TransferredAmountView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AmountCell", for: indexPath) as? AmountCollectionViewCell else {
            fatalError("Unable to dequeue AmountCollectionViewCell")
        }
        cell.configure(with: amounts[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        for cell in collectionView.visibleCells {
            cell.isSelected = false
        }
        
        // MARK: Tapped cell
        if let cell = collectionView.cellForItem(at: indexPath) as? AmountCollectionViewCell {
            cell.isSelected = true
        }
        
        print("Selected amount: \(amounts[indexPath.row])")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 83, height: 56)
    }
}

