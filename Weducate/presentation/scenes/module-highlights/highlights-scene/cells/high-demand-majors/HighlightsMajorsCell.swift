//
//  HighlightsMajorsCell.swift
//  Weducate
//
//  Created by Arifin Firdaus on 11/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class HighlightsMajorsCell: UITableViewCell {
    static let cellHeight: CGFloat = 234
    static let cellID = "HighlightsMajorsCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        registerCollectionViewCell()
        setupCollectionViewScrollDirection()
    }
    
    func registerCollectionViewCell() {
        let nib = UINib(nibName: HighlightsMajorCollectionViewCell.cellID, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: HighlightsMajorCollectionViewCell.cellID)
    }
    
    func setupCollectionViewScrollDirection() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: - UICollectionViewDataSource

extension HighlightsMajorsCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HighlightsMajorCollectionViewCell.cellID, for: indexPath) as! HighlightsMajorCollectionViewCell
        return cell
    }
    
}
// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension HighlightsMajorsCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = 200
        
        return CGSize(width: width, height: height)
    }
}


