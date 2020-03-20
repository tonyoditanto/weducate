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
    
    let repository = CategoryRepository()
    var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        fetchCategories()
    }
    
    func fetchCategories(){
        categories = repository.fetchCategories()
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

}

extension CategoryListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        cell.configureCell(for: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CategoryListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
}
