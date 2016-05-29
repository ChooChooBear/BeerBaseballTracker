//
//  OnBaseViewController.swift
//  Beer Baseball
//
//  Created by Rob Kiernan on 5/28/16.
//  Copyright © 2016 Rob Kiernan. All rights reserved.
//

import UIKit

class OnBaseViewConroller: UIViewController {
    
    var gameLogic = BeerBaseballLogic()
    
    @IBOutlet weak var onBaseLabel: UILabel!
    
    //only loads once
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tbvc = self.tabBarController as! GameTabBarController
        gameLogic = tbvc.gameLogic

        onBaseLabel.text = "test"
    }
    
    //loads each time the view appears on screen
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
}
