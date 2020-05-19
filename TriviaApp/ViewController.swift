//
//  ViewController.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

//------------------------------------------------------
//TEACHERS FEEDBACK
//------------------------------------------------------
//DESIGN: LOVE THE DESIGN. VERY COLORFUL, BRIGHT, EASY TO READ AND FRIENDLY
//DESIGN FIXES:
//THE QUESTION LABEL IS SET TO SMALL FOR A MULTIPLE LINES. INCREASED SIZE OF THE LABEL AND ALL OF THE QUESTION'S TEXT CAN BE DISPLAYED WITHOUT CUTTING IT OFF
//EXTRA PROGRESS BAR. VERY EASY FIX TO DELETE EXTRA OBJECTS YOU ARE NOT USING IN YOUR APP
//------------------------------------------------------


//------------------------------------------------------
//RESEARCH: EXCELLENT QUESTIONS - GREAT RESEARCH AND EYE OPENING FACTS!
//RESEARCH FIX: BE SURE TO INCLUDE CITATIONS, ACKS, AND AUTHORSHIP! VERY VERY VERY IMPORTANT!!!!
//------------------------------------------------------


//------------------------------------------------------
//CODE: NEARLY GOT EVERYTHING! YOU WERE MISSING SOME PARTS, BUT I VERY MUCH APPRECIATE THE EFFORT YOU PUT INTO THE PROJECT. YOU LEARNED SO MUCH ABOUT PROGRAMMING DOING THIS PROJECT SO I HOPE YOU FEEL YOUR EFFORTS WERE WORTH IT!
//CODE FIXES. TO FIX THE CODE YOU CAN DO THE FOLLOWING:
//-----------------------------------------------------
//--------------YES, THERES SOME PROBLEMS. SOME EASY TO SOLVE, SOME DIFFICULT.------------------
//--------------READ THROUGH MY COMMENTS AND LOOK AT THE CODE I CHANGED-------------------
//QUESTION KEEPS UPDATING AFTER USER PRESSES TRUE OR FALSE BUTTONS. THE UPDATEUI() FUNCTION WAS BEING CALLED BY THE TIMER EVERY 0.2 SECONDS. THE ARGUMENT (repeats: true) SHOULD BE CHANGED TO (repeats: false). THUS THE UPDATEUI() FUNCTION WILL ONLY BE CALLED ONCE WHEN THE USER PRESSES TRUE OR FALSE. SEE LINE 138
//CHECKANSWER() WAS MATCHING IF THE BUTTON'S NAME MATCHED THE ANSWER VALUE INSIDE THE ARRAY. THE TRUE AND FALSE BUTTONS ARE NAMED, 'TRUE' AND 'FALSE'...HOWEVER, THE ANSWER VALUE INSIDE THE ARRAY IS NAMED, 'True' AND 'False'. EVEN DIFFERENCES IN CASE MAKE A DIFFERENCE
//TO HAVE THE COLOR CHANGES WORK, YOU MUST CREATE AN IBOUTLET FOR EACH BUTTON AND USE THAT VARIABLE TO CHANGE ITS COLOR. SEE LINES 51 AND 52. ONCE DECLARED WE CAN USE THOSE VARIABLES TO CHANGE INDIVIDUAL BUTTONS. SEE LINES 82 AND 83.
//TO INCREASE SCORE EVERYTIME USER GETS A RIGHT ANSWER, ADD A CALL TO scoreRight IN QUIZBRAIN. SEE LINE 127
//PROGRESS BAR MUST ONLY TAKE A FLOAT. IF YOU DIVIDE TWO INTS YOU GET ANOTHER INT. IF YOU WANT TO DIVIDE TWO INTS AND SAVE IT AS A FLOAT, THEN CAST/CONVERT THE INTS TO FLOATS BEFORE DIVISION AND STORE THE RESULTING VALUE INSIDE OF A FLOAT VARIABLE. SEE LINE 98 IN QUIZBRAIN.

//------------------------------------------------------


import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var myQuizBrain = QuizBrain()
    var number : Float = 0.0
    var player : AVAudioPlayer!
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // THIS FUNCTION ALWAYS RUNS WHEN THE APP LOADS
        //VERY SIMILIAR TO SETUP() IN PROCESSING
        //THIS IS WHERE WE WILL CALL/ACTIVATE OUR CUSTOM FUNCTION, UPDATEUI()
        //UPDATEUI WILL SETUP EVERYTHING FOR THE REST OF THE CODE TO WORK
    }
    
    //UPDATEUI WILL UPDATE ANY ON SCREEN ELEMENTS AS WELL AS SETUP EVERYTHING FOR OUR FIRST PLAY THROUGH
    @objc func updateUI(){
        
        //CLEAR ANY COLOR CHANGES (FOR INSTANCE, IF THE COLOR CHANGES WHEN USER GETS QUESTION RIGHT/WRONG, WE WANT THE COLOR TO CHANGE BACK AFTER THEY ANSWER THE QUESTION

        //---------TEACHERS COMMENT-----------
        //THIS CODE WAS CAUSING ERRORS SO IT SHOULD BE REMOVED OR COMMENTED OUT
        //var answer = sender.currentTitle!
       // buttonPressed(sender.UIButton).backgroundColor = UIColor.blue
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
                
        //UPDATE THE PROGRESS BAR
      //  number = number + 0.1
        progressView.progress = myQuizBrain.progress()
       
        myQuizBrain.endQuiz()
        
        //UPDATE THE QUESTION THAT APPEARS ON SCREEN
        questionLabel.text = myQuizBrain.retrieveQuestion()
        
        //UPDATE THE SCORE VARIABLES
        scoreLabel.text = String(myQuizBrain.retrieveScore())
        
       
        //CONDITIONAL THAT WILL CHECK IF THE QUIZ IS OVER. SOME KIND ON SCREEN FEEDBACK SHOULD HAPPEN AT THIS POINT. DISPLAY SCORE, CONGRATULATE THE PLAYER, ETC
      
        if (myQuizBrain.endOfQuiz == true){
            questionLabel.text = "You're Done!"
            playSound(label : "35923_dr-skitz__yay(1)")
        }
       
        
    }
    
     //IBACTION FUNCTION (TRUE AND FALSE BUTTONS SHOULD BE LINKED TO THIS FUNCTION)
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        //STORE THE CURRENTTITLE OF THE BUTTON IN A VARIABLE
        var answer = sender.currentTitle!
        
         //CHECK THE ANSWER USING QUIZBRAIN
       
        var chosenAnswer = myQuizBrain.checkAnswer(answer : answer)
        print("the the chosenAnswer is: \(chosenAnswer)")
        //CONDITIONAL STATEMENT THAT WILL:
            //CHANGE THE BUTTONS COLOR DEPENDING IF THEY GOT IT RIGHT OR WRONG
            //INFORM THE USER IF THEY GOT IT RIGHT OR WRONG
                //Do you mean print something or display a word on the screen of the app?
        
        if chosenAnswer == true{
            sender.backgroundColor = UIColor.green //looked up on stackOverflow
          //score should increase
            myQuizBrain.scoreRight += 1
        
        }
        else{
            sender.backgroundColor = UIColor.red
            //looked up on StackOverflow
        }
        
        
        
        //USE A TIMER TO CALL UPDATEUI() TO CHANGE ON SCREEN ELEMENTS (UPDATE QUESTION TEXT, PROGRESS, SCORE, ETC). ITS A GOOD IDEA TO USE A TIMER SO WE CAN CONTROL HOW LONG THE COLOR CHANGES. EXAMPLE: USER PRESSES THE BUTTON->BUTTON COLOR CHANGES->TIMER FOR # OF SECONDS->CALL UPDATEUI() USING TIMER. REVIEW MUSICAPP FOR MORE REVIEW
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: false)

        sender.alpha = 0.5
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //Bring's sender's opacity back up to fully opaque.
        sender.alpha = 1.0
        
       
    }
         
  }
    
    func playSound(label : String) {
        guard let url = Bundle.main.url(forResource: label, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    } //end sound
    
}
