//
//  MeViewController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 16/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class MeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    // MARK: - Table view data source
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == MeViewControllerSection.SECTION_PROFILE_DETAIL {
            return 4
        }
        if section == MeViewControllerSection.SECTION_MY_WEDUCATE_JOURNEY {
            return 2
        }
        if section == MeViewControllerSection.SECTION_SIGN_OUT {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == MeViewControllerSection.SECTION_SIGN_OUT {
            showAlertController(withTitle: "Sign Out", message: "Are you sure you want to sign out?", completion: nil)
        }
    }


}
