//
//  HighlightsFeaturedCell.swift
//  Weducate
//
//  Created by Arifin Firdaus on 11/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

protocol HighlightsFeaturedCellDelegate {
    func highlightsFeaturedCell(_ highlightsFeaturedCell: HighlightsFeaturedCell, collectionView: UICollectionView, didSelect at: IndexPath)
}

class HighlightsFeaturedCell: UITableViewCell {
    static let cellID = "HighlightsFeaturedCell"
    static let cellHeight: CGFloat = 432

    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: HighlightsFeaturedCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCollectionViewCell()
        setupCollectionViewScrollDirection()
    }
    
    func registerCollectionViewCell() {
        let nib = UINib(nibName: "HighlightsFeaturedCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HighlightsFeaturedCollectionViewCell")
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

extension HighlightsFeaturedCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HighlightsFeaturedCollectionViewCell", for: indexPath) as! HighlightsFeaturedCollectionViewCell
        return cell
    }
    
}


// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension HighlightsFeaturedCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width) - (collectionView.frame.width * 1 / 8)
        let height: CGFloat = 400
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.highlightsFeaturedCell(self, collectionView: collectionView, didSelect: indexPath)
    }
}


