//
//  BorderlessButton.swift
//  Weducate
//
//  Created by Arifin Firdaus on 16/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

@IBDesignable
class BorderlessButton: UIButton {
    
    @IBInspectable var fontSize: CGFloat = 12 {
        didSet {
            titleLabel?.font = UIFont.systemFont(ofSize: self.fontSize, weight: .semibold)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        customizeView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func customizeView() {
        backgroundColor = .clear
        setTitleColor(.systemYellow, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
    }
    
}
