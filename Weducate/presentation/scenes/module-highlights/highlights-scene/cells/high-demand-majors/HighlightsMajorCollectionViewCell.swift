//
//  HighlightsMajorCollectionViewCell.swift
//  Weducate
//
//  Created by Arifin Firdaus on 11/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class HighlightsMajorCollectionViewCell: UICollectionViewCell {
    static let cellID = "HighlightsMajorCollectionViewCell"
    static let cellHeight: CGFloat = 64
    
    @IBOutlet weak var majorImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with major: Major) {
        majorImageView.image = UIImage(named: major.imageName)
        titleLabel.text = major.name
        descriptionLabel.text = major.domain
    }
    
}
