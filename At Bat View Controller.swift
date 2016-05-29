//
//  At Bat View Controller.swift
//  Beer Baseball
//
//  Created by Rob Kiernan on 5/24/16.
//  Copyright © 2016 Rob Kiernan. All rights reserved.
//

import UIKit


class AtBatViewController: UIViewController {
    
    var gameLogic = BeerBaseballLogic()
    
    var teamArray1: Array<Player> = Array<Player>()
    var teamArray2: Array<Player> = Array<Player>()
    var teamName1: String = "Team 1"
    var teamName2: String = "Team 2"
    
    @IBOutlet weak var lblInning: UILabel!
    
    @IBOutlet weak var lblOuts: UILabel!
    
    @IBOutlet weak var lblPlayerOnDeck: UILabel!
    
    @IBOutlet weak var lblPlayerAtBat: UILabel!
    
    @IBOutlet weak var lblTeamName1: UILabel!
    
    @IBOutlet weak var lblTeamName2: UILabel!
    
    @IBOutlet weak var lblTeam1Score: UILabel!
    
    @IBOutlet weak var lblTeam2Score: UILabel!
    
    @IBOutlet weak var lblBattingAverage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tbvc = self.tabBarController as! GameTabBarController
        gameLogic = tbvc.gameLogic
    
        updateUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    @IBAction func btnSingle(sender: UIButton) {

        (tabBarController as! GameTabBarController).gameLogic.baseRun(1)
        
        
        
        updateUI()
        
    }
    
    @IBAction func btnDouble(sender: UIButton) {
    
        (tabBarController as! GameTabBarController).gameLogic.baseRun(2)
        
       
        
        updateUI()
        
    }
    
    @IBAction func btnTriple(sender: UIButton) {
    
        (tabBarController as! GameTabBarController).gameLogic.baseRun(3)
        
        
        
        updateUI()
        
    }
    
    @IBAction func btnHomeRun(sender: UIButton) {
        
        (tabBarController as! GameTabBarController).gameLogic.homeRun()
        
        (tabBarController as! GameTabBarController).gameLogic.setNextPlayerOnDeck()
        (tabBarController as! GameTabBarController).gameLogic.setNextPlayerAtBat()
        
        updateUI()
        
    }
    
    @IBAction func btnOut(sender: UIButton) {

        (tabBarController as! GameTabBarController).gameLogic.gotOut()
        
        updateUI()
        
        print("Number of outs " + String(((tabBarController as! GameTabBarController).gameLogic.numberOfOuts)))
        
    }

    func updateUI() {
        
        print("updating UI...")
        
        lblTeamName1.text = gameLogic.teamName1
        lblTeamName2.text = gameLogic.teamName2
        
        lblTeam1Score.text = String(gameLogic.team1Score)
        lblTeam2Score.text = String(gameLogic.team2Score)
        
        lblInning.text = String(gameLogic.currentInning)
        lblOuts.text = String(gameLogic.numberOfOuts)
        
        lblPlayerOnDeck.text = (tabBarController as! GameTabBarController).gameLogic.getPlayerOnDeck()
        lblPlayerAtBat.text = (tabBarController as! GameTabBarController).gameLogic.getPlayerAtBat()
        lblBattingAverage.text = (tabBarController as! GameTabBarController).gameLogic.getBattingAverage()
        
    }
    
    
}

