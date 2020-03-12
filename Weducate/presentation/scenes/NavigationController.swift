//
//  NavigationController.swift
//  Weducate
//
//  Created by Arifin Firdaus on 12/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTintColor()
    }
    
    func changeTintColor() {
        navigationBar.tintColor = .systemYellow
    }
    
}
