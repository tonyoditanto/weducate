//
//  PlanningAllCell.swift
//  Weducate
//
//  Created by Arifin Firdaus on 19/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class PlanningAllCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var doingIndicatorView: RoundableCornerImageView!
    
    static let cellID = "PlanningAllCell"
    static let cellHeight: CGFloat = 72
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(With planning: Planning) {
        titleLabel.text = planning.title
        subtitleLabel.text = planning.detail
        
        switch planning.status {
        case .todo:
            removeStrikeThorughOnTitleLabel()
            doingIndicatorView.isHidden = true
        case .doing:
            applyStrikeThorughOnTitleLabel()
            doingIndicatorView.isHidden = false
        case .done:
            removeStrikeThorughOnTitleLabel()
            doingIndicatorView.isHidden = true
        }
    }
    
    private func applyStrikeThorughOnTitleLabel() {
        guard let text = titleLabel.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        titleLabel.attributedText = attributeString
    }
    
    private func removeStrikeThorughOnTitleLabel() {
        guard let text = titleLabel.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
        titleLabel.attributedText = attributeString
    }
    
    
}
