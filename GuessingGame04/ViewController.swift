//
//  ViewController.swift
//  GuessingGame04
//
//  Created by David Gudeman on 2/11/15.
//  Copyright (c) 2015 David Gudeman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var guesses = 0
  var numberToGuess = 0
  var gameOver = false
  
  
  @IBOutlet var userInput: UITextField!
  @IBOutlet var gameOutput: UILabel!
  
  @IBAction func userGuess(sender: AnyObject) {
    if gameOver {
      var newGame = userInput.text
      if newGame == "Y" {
        gameOver = false
        gameOutput.text = ""
        clearInput()
        numberToGuess = generateNumber()
        showOutput( "\n\nI'm thinking of a number....\n")
        return
      }
    }
    var possibleGuess : Int? = userInput.text.toInt()
    if let guess = possibleGuess {
      if guess > numberToGuess {
        showOutput("\(guess): You guessed to high!")
      } else if guess < numberToGuess {
        showOutput("\(guess): You guessed to low")
      } else {
        showOutput("\n\(guess): You win!\n")
        showOutput("Go again? (Y)")
        guesses = 0
        gameOver = true
      }
      clearInput()
    } else {
      showOutput("Please put in a valid number\n")
      clearInput()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    numberToGuess = generateNumber()
    showOutput("I'm thinking of a number....\n")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func showOutput(outText: String) {
    gameOutput.text = gameOutput.text! + outText
  }
  
  func generateNumber() -> Int {
    return random() % 100 + 1
  }
  func clearInput() {
    userInput.text = ""
  }
  
  
}




