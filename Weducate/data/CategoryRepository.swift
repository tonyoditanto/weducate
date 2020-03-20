//
//  CategoryRepository.swift
//  Weducate
//
//  Created by Tony Varian Yoditanto on 20/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import Foundation
class CategoryRepository {
    
    func fetchCategories() -> [Category] {
        var categories = [Category]()

        categories.append(Category(id: 1,
                                   name: "IT",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 2,
                                   name: "Natural Sciences",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 3,
                                   name: "Social",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 4,
                                   name: "Art",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 5,
                                   name: "Medical",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 6,
                                   name: "Engineering",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 7,
                                   name: "Business",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 8,
                                   name: "Agriculture",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 9,
                                   name: "Music",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 10,
                                   name: "Biotech",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 11,
                                   name: "Multimedia",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        categories.append(Category(id: 12,
                                   name: "Broadcasting",
                                   tagLine: "Love is a song, Love is the music",
                                   description: "In the Bachelor of Music degree program, studies in your major are combined with liberal arts courses, affording you a broad context in which to study and pursue your objectives in music.",
                                   iconImageName: "category_list_icon",
                                   mainImageName: "ic_music",
                                   previewImageName: ["img_featured", "img_featured", "img_featured"],
                                   relatedMajorsID: [1,2,3]))
        
        return categories
    }
    
}
