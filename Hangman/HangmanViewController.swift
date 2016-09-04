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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letterLabel.text = ""
        underscoreLabel.text = ""
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
            WordController.sharedController.createWord(word)
            print(word)
            
            self.updateUnderscore(word)
        }
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func updateUnderscore(word: String) -> String {
        let underscore = "_"
        var underscoreString = ""
        
        for _ in word.characters {
            underscoreString = underscoreString + underscore + " "
        }
        underscoreLabel.text = underscoreString
        return underscoreString
    }


}
