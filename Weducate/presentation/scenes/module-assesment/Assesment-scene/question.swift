//
//  question.swift
//  Weducate
//
//  Created by Bagus setiawan on 17/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import Foundation

struct Question {
    var questionImage : String
    var question : String
    var btnYes : String
    var btnNO: String
    
    init(image: String, questionText: String, choiceA: String, choiceB: String)
    {
        questionImage = image
        question = questionText
        btnYes = choiceA
        btnNO = choiceB
    }
}




