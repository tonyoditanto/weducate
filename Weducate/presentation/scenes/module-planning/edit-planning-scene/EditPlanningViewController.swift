//
//  EditPlanningViewController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 20/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class EditPlanningViewController: UITableViewController {
    
    var planning: Planning?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = planning?.title
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 2
        }
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */


}
