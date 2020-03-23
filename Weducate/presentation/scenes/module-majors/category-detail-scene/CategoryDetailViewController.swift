//
//  CategoryDetailViewController.swift
//  Weducate
//
//  Created by Tony Varian Yoditanto on 23/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == 0 {
            return makeHeaderCell(at: indexPath)
        }
        if section == 1 {
            return makeHeaderCell(at: indexPath)
        }
        if section == 2 {
            return makeHeaderCell(at: indexPath)

        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return HeaderCategoryDetailViewCell.cellHeight
        }
        if indexPath.section == 1 {
            return HeaderCategoryDetailViewCell.cellHeight
        }
        if indexPath.section == 2 {
            return HeaderCategoryDetailViewCell.cellHeight
        }
        
        return 500
    }
    
}


// MARK: - Views Helpers

extension CategoryDetailViewController {
    
    func makeHeaderCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCategoryDetailViewCell.cellID, for: indexPath) as! HeaderCategoryDetailViewCell

        cell.labelName.text = "Music"
        cell.labelSubtitle.text = "Life is a song, love is the music"
        cell.categoryImage.image = UIImage(named: "ic_music")
        return cell
    }
    
    
    func setupTableView() {
        registerHeaderCell()
        tableView.tableFooterView = UIView()
    }
    
    func registerHeaderCell() {
        let nib = UINib(nibName: HeaderCategoryDetailViewCell.cellID, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: HeaderCategoryDetailViewCell.cellID)
    }
}





