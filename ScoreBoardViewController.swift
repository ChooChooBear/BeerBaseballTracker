//
//  ScoreBoardViewController.swift
//  Beer Baseball
//
//  Created by Rob Kiernan on 5/28/16.
//  Copyright © 2016 Rob Kiernan. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController {
    
    var gameLogic = BeerBaseballLogic()
    
    @IBOutlet weak var scoreBoardLabel: UILabel!
    
    @IBOutlet weak var lblTeam2Score: UILabel!
    @IBOutlet weak var lblTeam1Name: UILabel!
    @IBOutlet weak var lblTeam2Name: UILabel!
    
    //only loads once
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tbvc = self.tabBarController as! GameTabBarController
        gameLogic = tbvc.gameLogic
        
        lblTeam1Name.text = String((tabBarController as! GameTabBarController).gameLogic.teamName1)
        lblTeam2Name.text = String((tabBarController as! GameTabBarController).gameLogic.teamName2)
    }
    
    //loads each time view shows on screen
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        scoreBoardLabel.text = String((tabBarController as! GameTabBarController).gameLogic.team1Score)
        lblTeam2Score.text = String((tabBarController as! GameTabBarController).gameLogic.team2Score)
    }
    
}
