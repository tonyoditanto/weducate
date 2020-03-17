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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        registerCells()
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
