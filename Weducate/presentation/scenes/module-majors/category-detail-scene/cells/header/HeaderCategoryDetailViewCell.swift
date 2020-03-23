//
//  HeaderCategoryDetailViewCell.swift
//  Weducate
//
//  Created by Tony Varian Yoditanto on 23/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class HeaderCategoryDetailViewCell: UITableViewCell {
    
    static let cellHeight: CGFloat = 164
    static let cellID = "HeaderCategoryDetailViewCell"
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(for category: Category) {
        labelName.text = category.name
        labelSubtitle.text = category.tagLine
        categoryImage.image = UIImage(named: category.iconImageName)
    }
    
}
