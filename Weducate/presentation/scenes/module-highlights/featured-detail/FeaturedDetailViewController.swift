//
//  FeaturedDetailViewController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 12/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class FeaturedDetailViewController: UIViewController {
    @IBOutlet weak private var featuredImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var majorNameLabel: UILabel!
    @IBOutlet weak private var descriptionTextView: UITextView!
    
    var titleText: String?
    var featuredImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        featuredImageView.image = featuredImage
        titleLabel.text = titleText
    }


}
