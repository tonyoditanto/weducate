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
    var majors = [Major]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchMajors()
    }
    
    func fetchMajors() {
        let repository = MajorRepository()
        majors = repository.fetchMajors()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = makeHeaderView(at: section)
        let headerViewLabel = makeHeaderViewLabel(at: section)
        headerView.addSubview(headerViewLabel)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == HighlightsViewControllerSection.SECTION_INFINITE_INSIGHTS {
            return 0
        }
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == HighlightsViewControllerSection.SECTION_FEATURED {
            return makeFeaturedCell(at: indexPath)
        }
        if section == HighlightsViewControllerSection.SECTION_MAJORS {
            return makeMajorsCell(at: indexPath)
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
            return 0
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
    
    func makeHeaderViewLabel(at section: Int) -> UILabel {
        let frame = CGRect(x: 16, y: 8, width: tableView.frame.width, height: 30)
        let label = UILabel(frame: frame)
        label.text = sectionTitles[section]
        
        label.textColor = makeTableHeaderTintColor(at: section)
        label.font = makeHeaderViewFont()
        
        return label
    }
    
    
    func makeFeaturedCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighlightsFeaturedCell", for: indexPath) as! HighlightsFeaturedCell
        cell.delegate = self
        return cell
    }
    
    func makeMajorsCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HighlightsMajorsCell.cellID, for: indexPath) as! HighlightsMajorsCell
        cell.configureCell(with: majors)
        return cell
    }
    
    func makeInfiniteInsightsCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfiniteInsightsCell.cellID, for: indexPath) as! InfiniteInsightsCell
        return cell
    }
    
    func makeDiscoverYouCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverYouViewCell.cellID, for: indexPath)
        return cell
    }
    
    func setupTableView() {
        registerFeaturedCell()
        registerMajorsCell()
        registerDiscoverYouCell()
        registerInfiniteInsightsCell()
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
    
    func registerInfiniteInsightsCell() {
        let nib = UINib(nibName: InfiniteInsightsCell.cellID, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: InfiniteInsightsCell.cellID)
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
            : .white
    }
    
    func makeTableHeaderTintColor(at section: Int) -> UIColor {
        return section == HighlightsViewControllerSection.SECTION_DISCOVER_YOU
            ? .white
            : .black
    }
    
    
}


// MARK: - Routing

extension HighlightsViewController {
    
    func showFeaturedDetailScene() {
        let storyboard = UIStoryboard(name: "Highlights", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "FeaturedDetailViewController") as! FeaturedDetailViewController
        viewController.featuredImage = #imageLiteral(resourceName: "img_featured")
        viewController.titleText = "World Class Designer is Here!"
        viewController.majorNameText = "Interior Design"
        navigationController?.pushViewController(viewController, animated: true)
    }
}


// MARK: - HighlightsFeaturedCellDelegate

extension HighlightsViewController: HighlightsFeaturedCellDelegate {
    
    func highlightsFeaturedCell(_ highlightsFeaturedCell: HighlightsFeaturedCell, collectionView: UICollectionView, didSelect at: IndexPath) {
        showFeaturedDetailScene()
    }
    
}
