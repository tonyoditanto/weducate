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
        setLabelsText(for: planning)
        configureCellStyle(forStatus: planning.status)
    }
    
    private func setLabelsText(for planning: Planning) {
        titleLabel.attributedText = NSMutableAttributedString(string: planning.title)
        subtitleLabel.attributedText = NSMutableAttributedString(string: planning.detail)
    }
    
    private func configureCellStyle(forStatus status: PlanningStatus) {
        switch status {
        case .todo:
            removeStrikeThorughOnTitleLabel()
            doingIndicatorView.isHidden = true
            changeLabelsColorForActiveState()
        case .doing:
            removeStrikeThorughOnTitleLabel()
            doingIndicatorView.isHidden = false
            changeLabelsColorForActiveState()
        case .done:
            applyStrikeThorughOnTitleLabel()
            doingIndicatorView.isHidden = true
            changeLabelsColorForInactiveState()
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
        attributeString.addAttribute(.strikethroughStyle, value: 0, range: NSMakeRange(0, attributeString.length))
        titleLabel.attributedText = attributeString
    }
    
    private func changeLabelsColorForActiveState() {
        titleLabel.textColor = .label
        subtitleLabel.textColor = .secondaryLabel
    }
    
    private func changeLabelsColorForInactiveState() {
        titleLabel.textColor = .secondaryLabel
        subtitleLabel.textColor = .tertiaryLabel
    }
    
}
