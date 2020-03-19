//
//  AssesmentViewController.swift
//  Weducate
//
//  Created by Bagus setiawan on 16/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import UIKit

    class AssesmentViewController: UIViewController {

    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNO: UIButton!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateQuestion(){
        
        if questionNumber <= allQuestions.list.count - 1{
            imgQuestion.image = UIImage(named:(allQuestions.list[questionNumber].questionImage))
            question.text = allQuestions.list[questionNumber].question
            btnYes.setTitle(allQuestions.list[questionNumber].btnYes, for: UIControl.State.normal)
            btnNO.setTitle(allQuestions.list[questionNumber].btnYes, for: UIControl.State.normal)
            updateUI()
            
        }else {
           let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)

            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
                UIAlertAction in
                NSLog("Cancel Pressed")
            }

            // Add the actions
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            present(alertController, animated: true, completion: nil)
        }
        
        
    }
        func updateUI(){
        
    }
        
}
