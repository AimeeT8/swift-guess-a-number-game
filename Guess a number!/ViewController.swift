//
//  ViewController.swift
//  Guess a number!
//
//  Created by A Temple on 2019-08-19.
//  Copyright © 2019 Aimee Temple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var submitButton: UIButton!
    @IBOutlet var guessTextField: UITextField!
    @IBOutlet weak var numOfTriesLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    var randomNumber = 0
    var numOfTries = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //generate random number when app opens
        generateRandomNumber()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        //open the keyboard on the guess text field when the app opens
        guessTextField.becomeFirstResponder()
        }
    
    
    
    @IBAction func submitAction(_ sender: Any) {
        
        //if the submit button's title equals "PLAY AGAIN", go to the play again function
        if(submitButton.titleLabel?.text == "PLAY AGAIN"){
           playAgain()
        }
        //otherwise we will go to the submit function
    else{
        submit()
            
        }
    }
        
        
    
    
    func submit(){
        
        
        let CORRECT = "Congrats! You guessed the right number!"
        let TOO_LOW = "Try again. Guess a number higher than "
        let TOO_HIGH = "Try again. Guess a number lower than "
        
        
        //get the string from the guess text field
        let guessString = guessTextField.text!
        
        //check to see if this string is empty
        if(guessString.isEmpty){
            return
        
        
    }
        
     //convert the string into a number to compare to the random number
    let currentNum = Int(guessString)!
        
        
        //create the message variable you will use to display on the info label
        var message = String(describing: currentNum) + "!"
        
        //if the guessed number equals the random number you win the game
        if (currentNum == randomNumber){
            
            //the message will be the correct string above
            message = CORRECT
            
            
            //set the submit buttons title to "PLAY AGAIN" to allow playing again
            submitButton.setTitle("PLAY AGAIN", for: .normal)
            
        }
        //if the guessed number is greater than the random number
        else if(currentNum > randomNumber){
            
            //the message will be the too high string from above plus the guessed number
            message = TOO_HIGH + message
            
            //increment the number of tries by 1 when incorrect
            setNumOfTries(number: numOfTries + 1)
            
        }
        
            //otherwise the guessed number is less than the random number
        else{
            
            //the message will be the too low string from above plus the guessed number
            message = TOO_LOW + message
            
            //increment the number of tries by 1 when incorrect
            setNumOfTries(number: numOfTries + 1)
            
        }
        //display the message on the info label
        infoLabel.text = message
        
        //clear the guessed text field for subsequent guesses 
        guessTextField.text = ""

}
    
    func setNumOfTries(number: Int){
        
        //set the class level variable for number of tries from the parameter passed in
        numOfTries = number
        
        //convert the integer into a string to display on the number of tries label
        let numberString = String(describing: number)
        
        //display the number of tries on the number of tries label
        numOfTriesLabel.text = "# of Tries: " + numberString
        
        
    }
    
    func playAgain(){
        
        //generate the random number again
        generateRandomNumber()
        
        //set the submit button's title to "SUBMIT" to submit guesses again
        submitButton.setTitle("SUBMIT", for: .normal)
        
        //reset the number of tries to 0 to play again
        setNumOfTries(number: 0)
        
        //clear the guess text field for good practice when starting the next game
        guessTextField.text = ""
        
        //clear the info label for a new game
        infoLabel.text = ""
        }
    
    func generateRandomNumber(){
        
        //generate a random number using the integer class and calling the
        //function
        //the in parameter will accept a range, so 1...100 means 1 through 100
        //incluing 1 and 100
        randomNumber = Int.random(in: 1...100)
        
        
    }

}
