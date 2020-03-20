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
    var selectedSegmentType: PlanningViewControllerCellType = .todo
    var searchTextField: UITextField?
    let searchController = UISearchController(searchResultsController: nil)
    
    let repository = PlanningRepository()
    var plannings = [Planning]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        tableView.tableFooterView = UIView()
        registerPlanningCell()
        fetchPlannings()
    }
    
    func fetchPlannings() {
        plannings = repository.fetchPlannings()
        tableView.reloadData()
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
    
    func registerPlanningCell() {
        let nib = UINib(nibName: PlanningCell.cellID, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: PlanningCell.cellID)
    }
    
    @IBAction func segmentedControlDidTap(_ sender: UISegmentedControl) {
        selectedSegmentIndex = sender.selectedSegmentIndex
        switch selectedSegmentIndex {
        case 0: selectedSegmentType = .todo
        case 1: selectedSegmentType = .doing
        case 2: selectedSegmentType = .done
        case 3: selectedSegmentType = .all
        default: selectedSegmentType = .todo
        }
        tableView.reloadData()
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedSegmentType == .todo {
            let todoPlannings = plannings.filter { planning -> Bool in
                return planning.status == .todo
            }
            return todoPlannings.count
        }
        if selectedSegmentType == .doing {
            let doingPlannings = plannings.filter { return $0.status == .doing }
            return doingPlannings.count
        }
        if selectedSegmentType == .done {
            return plannings
                .filter { return $0.status == .done }
                .count
        }
        if selectedSegmentType == .all {
            return plannings.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlanningCell.cellID, for: indexPath) as! PlanningCell
        var filteredPlannings = [Planning]()
        if selectedSegmentType == .todo {
            filteredPlannings = getPlannings(forStatus: .todo)
        }
        if selectedSegmentType == .doing {
            filteredPlannings = getPlannings(forStatus: .doing)
        }
        if selectedSegmentType == .done {
            filteredPlannings = getPlannings(forStatus: .done)
        }
        if selectedSegmentType == .all {
            filteredPlannings = plannings
        }
        
        let planning = filteredPlannings[indexPath.row]
        cell.configureCell(With: planning)
        
        return cell
    }
    
    func getPlannings(forStatus status: PlanningStatus) -> [Planning] {
        return plannings
            .filter { $0.status == status }
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PlanningCell.cellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let planning = plannings[indexPath.row]
        let viewController = makeEditPlanningViewController()
        viewController.planning = planning
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func makeEditPlanningViewController() -> EditPlanningViewController {
        let storyboard = UIStoryboard(name: "Planning", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "EditPlanningViewController") as! EditPlanningViewController
        return viewController
    }
    
}


// MARK: - UISearchResultsUpdating

extension PlanningViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
}
