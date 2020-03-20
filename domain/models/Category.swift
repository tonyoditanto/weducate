//
//  Category.swift
//  Weducate
//
//  Created by Tony Varian Yoditanto on 21/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import Foundation
//import UIKit
//
//class Category {
//    
//    var categoryIcon: UIImage
//    var categoryName: String
//    init(categoryIcon: UIImage, categoryName: String) {
//        self.categoryIcon = categoryIcon
//        self.categoryName = categoryName
//    }
//}

struct Category {
    var id: Int
    var name: String
    var tagLine: String
    var description: String
    var iconImageName: String
    var mainImageName: String
    var previewImageName: [String]
    var relatedMajorsID: [Int]
}
