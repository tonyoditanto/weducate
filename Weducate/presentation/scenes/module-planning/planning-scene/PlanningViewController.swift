//
//  PlanningViewController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 17/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

enum PlanningViewControllerCellType: Int {
    case todo
    case doing
    case done
    case all
}

class PlanningViewController: UITableViewController {
    var selectedSegmentIndex = 0
    var searchTextField: UITextField?
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        tableView.tableFooterView = UIView()
        registerCells()
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    @IBAction func addPlanBarButtonDidTap(_ sender: UIBarButtonItem) {
        showAddPlanningAlertController()
    }
    
    func showAddPlanningAlertController() {
        present(makeAlertController(), animated: true, completion: nil)
    }
    
    func makeAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: "Planning Item", message: "Input your planning item title", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        alertController.addTextField { textField in
            self.searchTextField = textField
            self.searchTextField?.placeholder = "Title"
        }
        return alertController
    }
    
    func registerCells() {
        registerPlanningToDoCell()
        registerPlanningDoingCell()
        registerPlanninDoneCell()
    }
    
    func registerPlanningToDoCell() {
        let nib = UINib(nibName: PlanningToDoCell.cellID, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: PlanningToDoCell.cellID)
    }
    
    func registerPlanningDoingCell() {
        let nib = UINib(nibName: PlanningDoingCell.cellID, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: PlanningDoingCell.cellID)
    }
    
    func registerPlanninDoneCell() {
        let nib = UINib(nibName: PlanningDoneCell.cellID, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: PlanningDoneCell.cellID)
    }
    
    @IBAction func segmentedControlDidTap(_ sender: UISegmentedControl) {
        selectedSegmentIndex = sender.selectedSegmentIndex
        tableView.reloadData()
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedSegmentIndex == PlanningViewControllerCellType.todo.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: PlanningToDoCell.cellID, for: indexPath)
            return cell
        }
        if selectedSegmentIndex == PlanningViewControllerCellType.doing.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: PlanningDoingCell.cellID, for: indexPath)
            return cell
        }
        if selectedSegmentIndex == PlanningViewControllerCellType.done.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: PlanningDoneCell.cellID, for: indexPath)
            return cell
        }
        if selectedSegmentIndex == PlanningViewControllerCellType.all.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: PlanningDoneCell.cellID, for: indexPath)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: PlanningToDoCell.cellID, for: indexPath)
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedSegmentIndex == PlanningViewControllerCellType.todo.rawValue {
            return PlanningToDoCell.cellHeight
        }
        if selectedSegmentIndex == PlanningViewControllerCellType.doing.rawValue {
            return PlanningDoingCell.cellHeight
        }
        if selectedSegmentIndex == PlanningViewControllerCellType.done.rawValue {
            return PlanningDoneCell.cellHeight
        }
        if selectedSegmentIndex == PlanningViewControllerCellType.all.rawValue {
            return PlanningDoneCell.cellHeight
        }
        return 0
    }
    
}


// MARK: - UISearchResultsUpdating

extension PlanningViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
}
