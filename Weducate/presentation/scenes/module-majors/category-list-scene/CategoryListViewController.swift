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
        
        let category1 = Category(categoryIcon: #imageLiteral(resourceName: "category_list_icon"), categoryName: "IT")
        let category2 = Category(categoryIcon: #imageLiteral(resourceName: "category_list_icon"), categoryName: "Natural Sciences")
        let category3 = Category(categoryIcon: #imageLiteral(resourceName: "category_list_icon"), categoryName: "Social")
        let category4 = Category(categoryIcon: #imageLiteral(resourceName: "category_list_icon"), categoryName: "Art")
        let category5 = Category(categoryIcon: #imageLiteral(resourceName: "category_list_icon"), categoryName: "Medical")
        let category6 = Category(categoryIcon: #imageLiteral(resourceName: "category_list_icon"), categoryName: "Engineering")
        
        tempCategories.append(category1)
        tempCategories.append(category2)
        tempCategories.append(category3)
        tempCategories.append(category4)
        tempCategories.append(category5)
        tempCategories.append(category6)
        
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
