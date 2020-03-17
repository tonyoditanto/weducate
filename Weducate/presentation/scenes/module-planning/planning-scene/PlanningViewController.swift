//
//  PlanningViewController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 17/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class PlanningViewController: UITableViewController {

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

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlanningDoneCell.cellID, for: indexPath) as! PlanningDoneCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PlanningToDoCell.cellHeight
    }

}
