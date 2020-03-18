//
//  CategoryListViewController.swift
//  Weducate
//
//  Created by Tony Varian Yoditanto on 17/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class CategoryListViewController: UIViewController {
    
    @IBOutlet weak var CategoryTableView: UITableView!
    
    var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        categories = createArray()
    }
    
    func createArray() -> [Category]{
        
        var tempCategories: [Category] = []
        let categoryNames: [String] = ["IT",
                                      "Natural Sciences",
                                      "Social",
                                      "Art",
                                      "Medical",
                                      "Engineering",
                                      "Business",
                                      "Agriculture",
                                      "Music",
                                      "Biotech",
                                      "Multimedia",
                                      "Broadcasting"]
        
        for categoryName in categoryNames{
            let category = Category(categoryIcon: #imageLiteral(resourceName: "category_list_icon"), categoryName: categoryName)
            tempCategories.append(category)
        }

        return tempCategories
    }

}

extension CategoryListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        
        cell.setCategory(category: category)
        
        return cell
    }
}
