//
//  UIViewController+Alert.swift
//  Weducate
//
//  Created by Arifin Firdaus on 16/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlertController(withTitle title: String, message: String, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Yes", style: .default) { action in
            completion?()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
