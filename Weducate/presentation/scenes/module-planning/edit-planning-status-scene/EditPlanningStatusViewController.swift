//
//  EditPlanningStatusViewController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 20/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit



class EditPlanningStatusViewController: UITableViewController {
    private var statuses = ["To do", "doing", "done"]
    private let cellID = "cellID"
    
    var selectedStatus: PlanningStatus = .todo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        registerTableViewCell()
        
    }
    
    func registerTableViewCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let status = statuses[indexPath.row]
        cell.textLabel?.text = status
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setSelectedStatus(indexPath)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    private func setSelectedStatus(_ indexPath: IndexPath) {
        let selectedRow = indexPath.row
        if selectedRow == 0 {
            selectedStatus = .todo
        }
        if selectedRow == 1 {
            selectedStatus = .doing
        }
        if selectedRow == 2 {
            selectedStatus = .done
        }
    }
    
}
