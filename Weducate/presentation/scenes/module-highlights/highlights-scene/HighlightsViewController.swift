//
//  HighlightsViewController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 11/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit


class HighlightsViewController: UITableViewController {
    let sectionTitles = ["Featured", "High Demand in Near Future", "Infinite Insights", "Discover You"]
    let SECTION_FEATURED = 0
    let SECTION_MAJORS = 1
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        registerFeaturedCell()
        registerMajorsCell()
        
        tableView.tableFooterView = UIView()
    }
    
    func registerFeaturedCell() {
        let nib = UINib(nibName: "HighlightsFeaturedCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HighlightsFeaturedCell")
    }
    
    func registerMajorsCell() {
        let nib = UINib(nibName: HighlightsMajorsCell.cellID, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: HighlightsMajorsCell.cellID)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = makeHeaderView()
        
        let label = UILabel()
        let title = sectionTitles[section]
        label.text = title
        label.font = makeHeaderViewFont()
        
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        label.sizeToFit()
        
        return view
    }
    
    
    func makeHeaderViewFont() -> UIFont {
        var font = UIFont.systemFont(ofSize: 22)
        if let newDescriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) {
            font = UIFont(descriptor: newDescriptor, size: font.pointSize)
        }
        return font
    }
    
    func makeHeaderView() -> UIView {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
        let view = UIView(frame: frame)
        view.backgroundColor = .secondarySystemBackground
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == SECTION_FEATURED {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HighlightsFeaturedCell", for: indexPath) as! HighlightsFeaturedCell
            return cell
        }
        if section == SECTION_MAJORS {
            let cell = tableView.dequeueReusableCell(withIdentifier: HighlightsMajorsCell.cellID, for: indexPath) as! HighlightsMajorsCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == SECTION_FEATURED {
            return 400
        }
        
        if indexPath.section == SECTION_MAJORS {
            return 234
        }
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        
        if section == SECTION_FEATURED {
            showFeaturedDetailScene()
        }
    }
    
    func showFeaturedDetailScene() {
        let storyboard = UIStoryboard(name: "Highlights", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "FeaturedDetailViewController") as! FeaturedDetailViewController
        viewController.featuredImage = #imageLiteral(resourceName: "img_featured")
        viewController.titleText = "fasdfadsfa"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
