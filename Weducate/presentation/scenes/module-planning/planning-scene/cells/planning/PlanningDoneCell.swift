//
//  PlanningDoneCell.swift
//  Weducate
//
//  Created by Arifin Firdaus on 17/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class PlanningDoneCell: UITableViewCell {
    static let cellID = "PlanningDoneCell"
    static let cellHeight: CGFloat = 72

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStrikeThorughOnTitleLabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func applyStrikeThorughOnTitleLabel() {
        guard let text = titleLabel.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        titleLabel.attributedText = attributeString
    }
    
}
