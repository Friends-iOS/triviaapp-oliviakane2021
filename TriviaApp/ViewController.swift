//
//  ViewController.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIView!
    
    
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
     
                
        //UPDATE THE PROGRESS BAR
        number = number + 0.1
        progressView.progress = number
       
        myQuizBrain.endQuiz()
        
        //UPDATE THE QUESTION THAT APPEARS ON SCREEN
        questionLabel.text = myQuizBrain.retrieveQuestion()
        
        //UPDATE THE SCORE VARIABLES
        scoreLabel.text = String(myQuizBrain.retrieveScore())
        
       
        //CONDITIONAL THAT WILL CHECK IF THE QUIZ IS OVER. SOME KIND ON SCREEN FEEDBACK SHOULD HAPPEN AT THIS POINT. DISPLAY SCORE, CONGRATULATE THE PLAYER, ETC
      
        if (myQuizBrain.arrayIndex > 19){
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
        
        //CONDITIONAL STATEMENT THAT WILL:
            //CHANGE THE BUTTONS COLOR DEPENDING IF THEY GOT IT RIGHT OR WRONG
            //INFORM THE USER IF THEY GOT IT RIGHT OR WRONG
                //Do you mean print something or display a word on the screen of the app?
        if chosenAnswer == true{
            sender.backgroundColor = UIColor.green //looked up on stackOverflow
          //score should increase
        
        }
        else{
            sender.backgroundColor = UIColor.red
            //looked up on StackOverflow
        }
        
        
        
        //USE A TIMER TO CALL UPDATEUI() TO CHANGE ON SCREEN ELEMENTS (UPDATE QUESTION TEXT, PROGRESS, SCORE, ETC). ITS A GOOD IDEA TO USE A TIMER SO WE CAN CONTROL HOW LONG THE COLOR CHANGES. EXAMPLE: USER PRESSES THE BUTTON->BUTTON COLOR CHANGES->TIMER FOR # OF SECONDS->CALL UPDATEUI() USING TIMER. REVIEW MUSICAPP FOR MORE REVIEW
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: true)

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


