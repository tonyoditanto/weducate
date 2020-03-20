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
    
    private var majors = [Major]()
    
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
    
    func configureCell(with majors: [Major]) {
        self.majors = majors
        collectionView.reloadData()
    }
    
}

// MARK: - UICollectionViewDataSource

extension HighlightsMajorsCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return majors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HighlightsMajorCollectionViewCell.cellID, for: indexPath) as!
        HighlightsMajorCollectionViewCell
        let major = majors[indexPath.row]
        cell.configureCell(with: major)
        return cell
    }
    
}
// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension HighlightsMajorsCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width) - (collectionView.frame.width) * 1 / 8
        let height: CGFloat = HighlightsMajorCollectionViewCell.cellHeight
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }

}


