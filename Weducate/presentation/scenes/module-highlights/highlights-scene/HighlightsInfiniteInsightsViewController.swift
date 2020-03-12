//
//  HighlightsInfiniteInsightsViewController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 12/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class HighlightsInfiniteInsightsViewController: UIViewController {
    static let viewControllerHeight: CGFloat = 216
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        registerCell()
        setupCollectionViewCell()
        setupCollectionViewScrollDirection()
    }
    
    func registerCell() {
        let nib = UINib(nibName: InfiniteInsightsCollectionViewCell.cellID, bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: InfiniteInsightsCollectionViewCell.cellID)
    }
    
    func setupCollectionViewCell() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupCollectionViewScrollDirection() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

    
}


// MARK: - UICollectionViewDataSource

extension HighlightsInfiniteInsightsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfiniteInsightsCollectionViewCell.cellID, for: indexPath) as! InfiniteInsightsCollectionViewCell
        return cell
    }
    
}


// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension HighlightsInfiniteInsightsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: InfiniteInsightsCollectionViewCell.cellWidth, height: InfiniteInsightsCollectionViewCell.cellHeight)
        return size
    }
    
}



