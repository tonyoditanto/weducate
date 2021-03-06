//
//  FeaturedCardView.swift
//  Weducate
//
//  Created by Arifin Firdaus on 15/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

@IBDesignable class FeaturedCardView: UIView {

  @IBInspectable var cornerRadius: CGFloat = 4 {
      didSet {
          layer.cornerRadius = cornerRadius
          layer.masksToBounds = cornerRadius > 0
      }
  }
  
    @IBInspectable var borderWidth: CGFloat = 0.2 {
      didSet {
          layer.borderWidth = borderWidth
      }
  }
  
    @IBInspectable var borderColor: UIColor? = .secondarySystemBackground {
      didSet {
          layer.borderColor = borderColor?.cgColor
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
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
      
      layer.borderWidth = borderWidth
      
      layer.borderColor = borderColor?.cgColor
  }

}
