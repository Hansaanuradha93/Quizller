//
//  Qustion.swift
//  Qizller
//
//  Created by Hansa Anuradha on 11/22/18.
//  Copyright © 2018 Hansa Anuradha. All rights reserved.
//

import Foundation

class Question {
    // Properties
    let questionText : String
    let answer : Bool
    
    // Initializer or Constructor
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
