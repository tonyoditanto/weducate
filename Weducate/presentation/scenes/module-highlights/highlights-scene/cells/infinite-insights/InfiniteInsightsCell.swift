//
//  InfiniteInsightsCell.swift
//  Weducate
//
//  Created by Arifin Firdaus on 12/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class InfiniteInsightsCell: UITableViewCell {
    static let cellID = "InfiniteInsightsCell"
    static let cellHeight: CGFloat = 224
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerInfiniteInsightsCollectionViewCell()
        setupCollectionView()
        setupCollectionViewScrollDirection()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func registerInfiniteInsightsCollectionViewCell() {
        let nib = UINib(nibName: InfiniteInsightsCollectionViewCell.cellID, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: InfiniteInsightsCollectionViewCell.cellID)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupCollectionViewScrollDirection() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
}


// MARK: - UICollectionViewDataSource

extension InfiniteInsightsCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfiniteInsightsCollectionViewCell.cellID, for: indexPath)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension InfiniteInsightsCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: InfiniteInsightsCollectionViewCell.cellWidth, height: InfiniteInsightsCollectionViewCell.cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
