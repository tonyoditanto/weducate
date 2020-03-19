//
//  Category.swift
//  Weducate
//
//  Created by Tony Varian Yoditanto on 17/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import Foundation
import UIKit

class Category {
    
    var categoryIcon: UIImage
    var categoryName: String
    init(categoryIcon: UIImage, categoryName: String) {
        self.categoryIcon = categoryIcon
        self.categoryName = categoryName
    }
}
