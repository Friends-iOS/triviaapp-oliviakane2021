//
//  File.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

import Foundation

//begin struct

struct Question{
    
    var text : String
    var answer: String
    
    init(q: String, a: String){
        text = q;
        answer = a;
    }
}

//array of Question structs
struct QuizBrain{
    let array_of_questions = [Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:""),Question(q:"", a:"")]



//variable for our array index
var arrayIndex : Int

//variable for number of right answers
var rightAnswers : Int

//variable for number of wrong answers
var wrongAnswers : Int

//variable to act as a flag if the user reaches the end of the quiz
var questionCount : Int

//FUNCTION - checking the users answer
    //FORM: func function_name(user's answer (ie a String) -> returns a true or false
    //conditional statement that will return correct if user's answer matches, wrong if not
    
    //send title of the button to the question in the array to see if same answer
    
    func checkAnswer(answer:String)  {
      
    }

//FUNCTION - retrieving the questions text
    //FORM: func functions_name() -> returns question (ie String)
    
    func displayQuestion(Question:String) -> String{
        return Question
    }

    //FUNCTION - Retrieves user's progress (question number / total number of questions)
    //FORM: func functions_name() -> returns a number (ie Float)

//FUNCTION - retrieves user's score (score right / total number of answers)
    //FORM: func functions_name -> This could a String ("this is your score...") or could just be a number (ie Float)

//FUNCTION - updates the variable that is acting as our array index (where in the index are we currently). When the user answers a question, we want to move to the next question
    //FORM: mutating func function_name()
    mutating func changeQuestion(){
        
    }

}
