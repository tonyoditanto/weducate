//
//  HighlightsFeaturedCollectionViewCell.swift
//  Weducate
//
//  Created by Arifin Firdaus on 11/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class HighlightsFeaturedCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor.secondarySystemFill.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 4
    }

}
