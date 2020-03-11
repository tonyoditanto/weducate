//
//  HighlightsFeaturedCell.swift
//  Weducate
//
//  Created by Arifin Firdaus on 11/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class HighlightsFeaturedCell: UITableViewCell {
    static let cellID = "HighlightsFeaturedCell"
    static let cellHeight: CGFloat = 432

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.indicatorStyle = .black
        
        let nib = UINib(nibName: "HighlightsFeaturedCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "HighlightsFeaturedCollectionViewCell")
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
        let width = collectionView.frame.width
        let height: CGFloat = 400
        
        return CGSize(width: width, height: height)
    }
}

