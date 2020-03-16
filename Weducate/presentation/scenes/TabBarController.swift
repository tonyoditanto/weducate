//
//  TabBarController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 12/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeTintColor()
    }
    
    func changeTintColor() {
        tabBar.tintColor = .systemYellow
    }

}
