//
//  CategoryTableViewCell.swift
//  Weducate
//
//  Created by Tony Varian Yoditanto on 17/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var CategoryImageView: UIImageView!
    @IBOutlet weak var CategoryNameLabel: UILabel!
    
    func configureCell(for category: Category) {
        CategoryNameLabel.text = category.name
        CategoryImageView.image = UIImage(named: category.iconImageName)
    }
    
}
