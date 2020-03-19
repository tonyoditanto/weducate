//
//  bankQuestion.swift
//  Weducate
//
//  Created by Bagus setiawan on 17/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import Foundation

class QuestionBank{
    var list = [Question] ()
    
    init()
    {
         list.append(Question(image: "img_question1", questionText: "This British overseas territory is a popular tax haven.", choiceA: "Yes", choiceB: "NO"))
         list.append(Question(image: "img_question2", questionText: "This British overseas territory is a popular tax haven.", choiceA: "Yes", choiceB: "NO"))
         list.append(Question(image: "img_question3", questionText: "This British overseas territory is a popular tax haven.", choiceA: "Yes", choiceB: "NO"))
        
    }
}
