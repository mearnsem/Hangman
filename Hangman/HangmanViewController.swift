//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Emily Mearns on 9/4/16.
//  Copyright © 2016 em. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var underscoreLabel: UILabel!
    
    
    var word: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        letterLabel.text = ""
        underscoreLabel.text = ""
    }
    
    @IBAction func guessButton(sender: AnyObject) {
        var letterTextField: UITextField?
        
        let alertController = UIAlertController(title: "Guess a Letter!", message: nil, preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Guess one letter"
            letterTextField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (_) in
            guard let letter = letterTextField?.text where letterTextField?.text?.characters.count == 1 else {return}
            print(letter)
            self.updateLetter(letter)
        }
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func newWordButton(sender: AnyObject) {
        var wordTextField: UITextField?
        
        let alertController = UIAlertController(title: "New Word", message: "Type in a new word", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "New Word"
            wordTextField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (_) in
            guard let word = wordTextField?.text else {return}
            print(word)
            self.word = word
            self.updateUnderscore(word)
            
        }
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func updateUnderscore(word: String) {
        let underscore = "_"
        var underscoreString = ""
        
        for _ in word.characters {
            underscoreString = underscoreString + underscore + "  "
        }
        
        underscoreLabel.text = underscoreString
    }

    func updateWord(word: String) {
        let space = " "
        var wordString = ""
        
        for letter in word.characters {
            wordString = wordString + String(letter) + space
        }
        
        letterLabel.text = wordString.uppercaseString
    }
    
    func updateLetter(letter: String) {
        
    }

}
