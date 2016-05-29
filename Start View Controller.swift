//
//  ViewController.swift
//  Beer Baseball
//
//  Created by Rob Kiernan on 5/24/16.
//  Copyright © 2016 Rob Kiernan. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var team1Array = Array<Player>()
    var team2Array = Array<Player>()
    
    var onBaseTest = 1
    var scoreBoardTest = 2
    
    @IBOutlet weak var teamName1Text: UITextField!
    
    @IBOutlet weak var teamName2Text: UITextField!
    
    @IBAction func enterNames(sender: UIButton) {
    
        switch sender.currentTitle! {
        case "Enter Team 1 Players":
            askPlayerName(true)
        case "Enter Team 2 Players":
            askPlayerName(false)
        default:
            print("This should not print, error with enterNames method")
        }
    }
    
    @IBAction func startGame(sender: UIButton) {
        
        if team1Array.count != 0 && team2Array.count != 0{
            print("not empty, proceed")
        } else {
            print("array 1 or 2 has no members, stop")
        }
        
        if teamName1Text != nil && teamName2Text != nil {
            print("proceed")
        } else {
            print("at least one of the names are empty, stop")
        }
        
    } //end of startGame
    
    func askPlayerName(isOnTeam1: Bool) {
        
        switch isOnTeam1 {
    
        case true:
            
            //1. Create the alert controller
            let alert = UIAlertController(title: "\(teamName1Text.text!)", message: " Enter player's name below in batting order", preferredStyle: .Alert)
            
            //2. Add 4 text fields with placeholders for number
            alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Player number 1"
            })
            alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Player number 2"
            })
            alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Player number 3"
            })
            alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Player number 4"
            })
            
            //3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                
                
                let textField1 = alert.textFields![0] as UITextField
                if textField1.text != "" {
                    self.team1Array.append(Player(name: textField1.text!, team1: true))
                }
    
                let textField2 = alert.textFields![1] as UITextField
                if textField1.text != "" {
                    self.team1Array.append((Player(name: textField2.text!, team1: true)))
                }
                
                let textField3 = alert.textFields![2] as UITextField
                if textField3.text != "" {
                    self.team1Array.append((Player(name: textField3.text!, team1: true)))
                }
                
                let textField4 = alert.textFields![3] as UITextField
                if textField4.text != "" {
                    self.team1Array.append((Player(name: textField4.text!, team1: true)))
                }
                
                
            }))
            
            // 4. Present the alert.
            self.presentViewController(alert, animated: true, completion: nil)
            
        case false:
            //1. Create the alert controller
            let alert = UIAlertController(title: "\(teamName2Text.text!)", message: " Enter player's name below in batting order", preferredStyle: .Alert)
            
            //2. Add 4 text fields with placeholders for number
            alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Player number 1"
            })
            alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Player number 2"
            })
            alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Player number 3"
            })
            alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Player number 4"
            })
            
            //3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                
                
                let textField1 = alert.textFields![0] as UITextField
                if textField1.text != "" {
                    self.team2Array.append(Player(name: textField1.text!, team1: false))
                }
                
                let textField2 = alert.textFields![1] as UITextField
                if textField1.text != "" {
                    self.team2Array.append((Player(name: textField2.text!, team1: false)))
                }
                
                let textField3 = alert.textFields![2] as UITextField
                if textField3.text != "" {
                    self.team2Array.append((Player(name: textField3.text!, team1: false)))
                }
                
                let textField4 = alert.textFields![3] as UITextField
                if textField4.text != "" {
                    self.team2Array.append((Player(name: textField4.text!, team1: false)))
                }
                
                
            }))
            
            // 4. Present the alert.
            self.presentViewController(alert, animated: true, completion: nil)

        }//end switch
    }
    
    override func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
//        if (segue.identifier == "startGame") {
//            let barViewControllers = segue.destinationViewController as! UITabBarController
//            let atBat = barViewControllers.viewControllers![0] as! AtBatViewController
//            let onBase = barViewControllers.viewControllers![1] as! OnBaseViewConroller
//                onBase.onBaseSegueTest = self.onBaseTest
//            let scoreBoard = barViewControllers.viewControllers![2] as! ScoreBoardViewController
//                scoreBoard.scoreBoardSequeTest = self.scoreBoardTest
//        }
        let tbvc = segue.destinationViewController as! GameTabBarController
        tbvc.gameLogic.team1Array = self.team1Array
        tbvc.gameLogic.team2Array = self.team2Array
        tbvc.gameLogic.teamName1 = self.teamName1Text.text!
        tbvc.gameLogic.teamName2 = self.teamName2Text.text!
    }

}

