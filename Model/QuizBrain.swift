//
//  File.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

//this struct will be the heart of the question bank
//it contains two fields, and no functions
//only serving to be the "question/answer" part of the code
struct Question {
    
    //two fields for qustions and answers
    //both declared as Strings, since nothing else will be in there
    var text: String
    var answer: String
    
    //our init function will initialize the two fields with whatever
    init(q: String, a: String) {
        text = q;
        answer = a;
    }
    
}

import Foundation

//begin struct
struct QuizBrain{
    
//array of Question structs
//instead of an array of Strings (like in the Town example) we will have an array of Question structs
//FORM: let quiz = [Question(q: "question", a: "answer"), Question(q: "questions", a: "answer")]
    
    let quiz = [
    
        Question(q: "In 2015 there were only 21 female heads of state in the entire world.", a: "True"),
        Question(q: "In the United States, 22%–35% of women who visit hospital emergency rooms do so because of domestic violence.", a: "False"),
        Question(q: "The wage gap-the disparity between women’s and men’s earnings-remains constant regardless of age.", a: "False"),
        Question(q: "Over 150 countries have at least one actively sexist law", a: "True"),
        Question(q: " Each minute, 28 girls are married before they are ready", a: "True"),
        Question(q: "Men who enter female-dominated occupations typically encounter the same type of glass ceiling that women encounter when they enter male-dominated occupations", a: "False"),
        Question(q: "1 in 3 women have experienced physical or sexual violence at some point in their lifetime", a: "True"),
        Question(q: "In most countries, women only earn between 60 and 75% of men’s wages - for the same work", a: "True"),
        Question(q: "Fewer than 50 countries in the world have taken action to track budget allocations for gender equality.", a: "False"),
        Question(q: "The majority of college students these days are men.", a: "False"),
        Question(q: "There are approximately 781 million illiterate adults worldwide – two-thirds of whom are women", a: "True"),
        Question(q: "63 million girls still need to go to school", a: "True"),
        Question(q: "Most cases of military sexual assault that are reported end in prosecution.", a: "False"),
        Question(q: "The US is one of only eight countries in the world that does not provide any form of paid maternity leave.", a: "True"),
        Question(q: "On average, women around the world spend more than twice as many hours as men doing unpaid work.", a: "True"),
        Question(q: "Rates of rape and sexual assault have increased steadily since the mid 1990s.", a: "False"),
        Question(q: "17 countries limit when and how women can travel outside the home.", a: "True"),
        Question(q: "29 countries restrict the hours women can work.", a: "True"),
        Question(q: "Men are abused by their partners as often as women", a: "False"),
        Question(q: "18 countries allow men to prohibit their wives from working.", a: "True")
        
    ]
   
    
//variable for our array index - Int
    var arrayIndex : Int = -1 // this is the beginning of the array
    
//variable for number of right answers - Int
    var scoreRight : Int = 0 //we start at zero
    
//variable for number of wrong answers - Int
    var scoreWrong : Int = 0 // we start at zero
    
//variable to act as a flag if the user reaches the end of the quiz - Int or Boolean or String
    var endOfQuiz : Bool = false

//FUNCTION - checking the users answer. This will check if the String sent from the ViewController (ie, the user's answer) matches the String from the array of Question structs (ie, the answer)
    //FORM: func function_name(user's answer (ie a String) -> returns a true or false
    //conditional statement that will return true if user's answer matches, false if not
    func checkAnswer (answer : String) -> Bool{
        print("the arrayIndex is \(arrayIndex)")
        print("the user's answer is \(answer)")
        print(quiz[arrayIndex])
        if (answer == quiz[arrayIndex].answer){
            return true
        }
        else{
            return false
        }
    }

//**FUNCTION - retrieving the questions text from the array of Question structs
    //FORM: func functions_name() -> returns question (ie String)
    func retrieveQuestion() -> String {
        return (quiz[arrayIndex].text)
    }

//**FUNCTION - Retrieves user's progress (question number / total number of questions)
    //FORM: func functions_name() -> returns a number (ie Float)
    func progress () -> Float {
        return Float(Float(arrayIndex)/Float(20))
    }

//FUNCTION - retrieves user's score (score right / total number of answers)
    //FORM: func functions_name -> This could a String ("this is your score...") or could just be a number (ie Float)
    func retrieveScore() -> Int {
        return Int(scoreRight)
    }

//FUNCTION - updates the variable that is acting as our array index (we need a "pointer" that will keep track of where in the array we are). Useful for knowing what question we're on and when the quiz is over.
    //FORM: func function_name()
    mutating func endQuiz (){
        arrayIndex = arrayIndex + 1
        
        if (arrayIndex < quiz.count - 1){
            arrayIndex += 1;
               
        }
        //end of quiz
        else{
         arrayIndex = 0;
         endOfQuiz = true;
        
     }
        
//        if (arrayIndex > 19){
//        arrayIndex = 0
//        }
    }
}

