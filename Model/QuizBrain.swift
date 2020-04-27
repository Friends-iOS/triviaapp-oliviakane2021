//
//  File.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

import Foundation

struct QuizBrain{
    
    var questions : [String : String]
    var arrayIndex : Int
    var rightAnswers : Int
    var wrongAnswers : Int
    var questionCount : Int

    init(triviaQuestions : [String : String], index : Int, correct : Int, incorrect : Int, end: Int){
        questions = triviaQuestions
        arrayIndex = index
        rightAnswers = correct
        wrongAnswers = incorrect
        questionCount = end
        
    }

        
    func displayQuestion(triviaQuestions:String) -> String{
        return questions [triviaQuestions]!
        }
    
    func progess () -> Float {
        return Float(arrayIndex / 20)
    }
    
    func score () -> Float {
        return Float(rightAnswers/20)
    }
    
    mutating func movingOn (nextQuestion : Int){
        arrayIndex = arrayIndex - 1
    }

}


var myQuizBrain = QuizBrain(triviaQuestions:["In 2015 there were only 21 female heads of state in the entire world." : "True", "Over 150 countries have at least one actively sexist law" : "True", "1 in 3 women have experienced physical or sexual violence at some point in their lifetime" : "True", "In most countries, women only earn between 60 and 75% of men’s wages - for the same work" : "True", "There are approximately 781 million illiterate adults worldwide – two-thirds of whom are women" : "True", " 63 million girls still need to go to school" : "True", "The US is one of only eight countries in the world that does not provide any form of paid maternity leave." : "True", "On average, women around the world spend more than twice as many hours as men doing unpaid work." : "True", "18 countries allow men to prohibit their wives from working." : "True", " In the United States, 22%–35% of women who visit hospital emergency rooms do so because of domestic violence." : "False", "The wage gap-the disparity between women’s and men’s earnings-remains constant regardless of age." : "False", "Men who enter female-dominated occupations typically encounter the same type of glass ceiling that women encounter when they enter male-dominated occupations." : "False", "From a functionalist perspective, communication patterns perpetuate male dominance and female subordination in society." : "False", "Fewer than 50 countries in the world have taken action to track budget allocations for gender equality." : "False", "The majority of college students these days are men." : "False", "Most cases of military sexual assault that are reported end in prosecution." : "False", "Rates of rape and sexual assault have increased steadily since the mid 1990s." : "False", "17 countries limit when and how women can travel outside the home." : "True", "29 countries restrict the hours women can work." : "True"], index: 20, correct: 20, incorrect: 20, end: 20)
    
    
 
//array of Question structs

//variable for our array index
//variable for number of right answers
//variable for number of wrong answers
//variable to act as a flag if the user reaches the end of the quiz


    
//FUNCTION - checking the users answer
    //FORM: func function_name(user's answer (ie a String) -> returns a true or false
    //conditional statement that will return correct if user's answer matches, wrong if not
    
    //send title of the button to the question in the array to see if same answer
    
   

//FUNCTION - retrieving the questions text
    //FORM: func functions_name() -> returns question (ie String)
   //DONE
   


    //FUNCTION - Retrieves user's progress (question number / total number of questions)
    //FORM: func functions_name() -> returns a number (ie Float)


//FUNCTION - retrieves user's score (score right / total number of answers)
    //FORM: func functions_name -> This could a String ("this is your score...") or could just be a number (ie Float)

//FUNCTION - updates the variable that is acting as our array index (where in the index are we currently). When the user answers a question, we want to move to the next question
    //FORM: mutating func function_name()


