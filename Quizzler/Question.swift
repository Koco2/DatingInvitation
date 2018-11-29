//
//  Qestion.swift
//  Quizzler
//
//  Created by Chen Wang on 12/14/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    let questionText: String
    let answer: Int
    let choice1: String
    let choice2: String
    let choice3: String
    
    init(text:String, correctAnswer:Int, c1:String, c2:String, c3:String)
    {
        questionText = text
        answer = correctAnswer
        choice1 = c1
        choice2 = c2
        choice3 = c3
    }
}
