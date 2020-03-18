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
    
    var searchTextField: UITextField?
    let searchController = UISearchController(searchResultsController: nil)
    
    var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        categories = createArray()
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
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
        
        for categoryLabel in categoryNames{
            let category = Category(categoryIcon: #imageLiteral(resourceName: "category_list_icon"), categoryName: categoryLabel)
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

extension CategoryListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
}
