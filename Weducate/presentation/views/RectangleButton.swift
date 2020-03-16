//
//  RectangleButton.swift
//  Weducate
//
//  Created by Arifin Firdaus on 12/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

@IBDesignable
class RectangleButton: UIButton {
    
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
        backgroundColor = .systemYellow
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    
}
