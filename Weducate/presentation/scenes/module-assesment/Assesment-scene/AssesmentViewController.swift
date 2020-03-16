//
//  AssesmentViewController.swift
//  Weducate
//
//  Created by Bagus setiawan on 12/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

class AllertViewController: UIViewController {

@IBOutlet weak var logoView : UIImageView!
    
var logo : UIImage?

override func viewDidLoad() {
    super.viewDidLoad()
    logoView.image = logo
    
}
    
func UIAllertController() {
    let alertController = UIAlertController(title: "Question ?", message: "Are you ready to find out about your interest ?", preferredStyle: UIAlertController.Style.alert)

    alertController.addAction(UIAlertAction(title: "NO", style : UIAlertAction.Style.default, handler: { _ in
        //Cancel Action
    }))
    alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                                    //Sign out action
    }))
    self.present(alertController, animated: true, completion: nil)
}
}
