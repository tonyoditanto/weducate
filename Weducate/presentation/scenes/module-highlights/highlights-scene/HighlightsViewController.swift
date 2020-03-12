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
    let discoverCellID = "DiscoverCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = makeHeaderView(at: section)
        
        let label = UILabel()
        let title = sectionTitles[section]
        label.text = title
        label.textColor = makeTableHeaderTintColor(at: section)
        label.font = makeHeaderViewFont()
        
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        label.sizeToFit()
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == HighlightsViewControllerSection.SECTION_FEATURED {
            return makeFeaturedCell(at: indexPath)
        }
        if section == HighlightsViewControllerSection.SECTION_MAJORS {
            return makeFeaturedCell(at: indexPath)
        }
        if section == HighlightsViewControllerSection.SECTION_INFINITE_INSIGHTS {
            return makeInfiniteInsightsCell(at: indexPath)
        }
        if section == HighlightsViewControllerSection.SECTION_DISCOVER_YOU {
            return makeDiscoverYouCell(at: indexPath)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == HighlightsViewControllerSection.SECTION_FEATURED {
            return 400
        }
        if indexPath.section == HighlightsViewControllerSection.SECTION_MAJORS {
            return 234
        }
        if indexPath.section == HighlightsViewControllerSection.SECTION_INFINITE_INSIGHTS {
            return HighlightsInfiniteInsightsViewController.viewControllerHeight
        }
        if indexPath.section == HighlightsViewControllerSection.SECTION_DISCOVER_YOU {
            return DiscoverYouViewCell.cellHeight
        }
        
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        
        if section == HighlightsViewControllerSection.SECTION_FEATURED {
            showFeaturedDetailScene()
        }
    }
}


// MARK: - Views Helpers

extension HighlightsViewController {
    
    func makeFeaturedCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighlightsFeaturedCell", for: indexPath) as! HighlightsFeaturedCell
        return cell
    }
    
    func makeMajorsCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HighlightsMajorsCell.cellID, for: indexPath) as! HighlightsMajorsCell
        return cell
    }
    
    func makeInfiniteInsightsCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: discoverCellID, for: indexPath)
        addChildVC(asChildViewController: makeInfiniteInsightsDiscoverYouViewController(), to: cell.contentView)
        return cell
    }
    
    func makeDiscoverYouCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverYouViewCell.cellID, for: indexPath)
        return cell
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        registerFeaturedCell()
        registerMajorsCell()
        registerDiscoverYouCell()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: discoverCellID)
        
        tableView.tableFooterView = UIView()
    }
    
    func registerDiscoverYouCell() {
        let nib = UINib(nibName: DiscoverYouViewCell.cellID, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: DiscoverYouViewCell.cellID)
    }
    
    func registerFeaturedCell() {
        let nib = UINib(nibName: "HighlightsFeaturedCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "HighlightsFeaturedCell")
    }
    
    func registerMajorsCell() {
        let nib = UINib(nibName: HighlightsMajorsCell.cellID, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: HighlightsMajorsCell.cellID)
    }
    
    func makeHeaderViewFont() -> UIFont {
        var font = UIFont.systemFont(ofSize: 22)
        if let newDescriptor = font.fontDescriptor.withSymbolicTraits(.traitBold) {
            font = UIFont(descriptor: newDescriptor, size: font.pointSize)
        }
        return font
    }
    
    func makeHeaderView(at section: Int) -> UIView {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
        let view = UIView(frame: frame)
        view.backgroundColor = .clear
        view.backgroundColor = makeTableHeaderViewColor(at: section)
        return view
    }
    
    func makeTableHeaderViewColor(at section: Int) -> UIColor {
        return section == HighlightsViewControllerSection.SECTION_DISCOVER_YOU
            ? UIColor(named: "color_soft_brown")!
            : .secondarySystemBackground
    }
    
    func makeTableHeaderTintColor(at section: Int) -> UIColor {
        return section == HighlightsViewControllerSection.SECTION_DISCOVER_YOU
            ? .white
            : .black
    }
    
    func makeInfiniteInsightsDiscoverYouViewController() -> HighlightsInfiniteInsightsViewController {
        let storyboard = UIStoryboard(name: "Highlights", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "HighlightsInfiniteInsightsViewController") as! HighlightsInfiniteInsightsViewController
        return viewController
    }

    
}


// MARK: - Routing

extension HighlightsViewController {
    
    func showFeaturedDetailScene() {
        let storyboard = UIStoryboard(name: "Highlights", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "FeaturedDetailViewController") as! FeaturedDetailViewController
        viewController.featuredImage = #imageLiteral(resourceName: "img_featured")
        viewController.titleText = "fasdfadsfa"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
