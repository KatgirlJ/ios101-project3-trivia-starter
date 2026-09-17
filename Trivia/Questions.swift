//
//  Questions.swift
//  Trivia
//
//  Created by Katrinna Jones on 9/16/26.
//

import UIKit

struct QuestionsandAnswers{
    let question: String
    let questionType: String
    let questionSubType: String
    let answers: [String: Bool]
}

class Questions {
    
    static let questionsAsked: [QuestionsandAnswers] = [
        QuestionsandAnswers(
            question: "What planet is closet to the sun?", questionType: "Science", questionSubType: "Astronomy", answers: ["Venus": false, "Mercury": true, "Mars": false, "Earth": false]),
        QuestionsandAnswers(question: "What does the CPU stand for?", questionType: "Computer Science", questionSubType: "Hardware", answers: ["Central Processing Unit": true, "Computer Personal Unit": false, "Central Program Utility": false, "Core Processing Unit": false]),
        QuestionsandAnswers(question: "Which language has the most native speakers?", questionType: "World", questionSubType: "Language", answers: ["English": false, "Hindi": false, "Manderian": true, "Spanish": false]),
        QuestionsandAnswers(question: "What is the world's longest river", questionType: "Geography", questionSubType: "Rivers", answers: ["Amazon": false, "Mississippi": false, "Yangtze": false, "Nile": true]),
        QuestionsandAnswers(question: "How many stripes are on the US flag?", questionType: "US History", questionSubType: "Flags", answers: ["11": false, "15": false, "13": true, "50": false])
    ]
    
}

