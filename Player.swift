//
//  Player.swift
//  Beer Baseball
//
//  Created by Rob Kiernan on 5/24/16.
//  Copyright © 2016 Rob Kiernan. All rights reserved.
//

import Foundation

class Player {

    var playerName: String
    var isOnTeam1: Bool
    var numberOfAtBats, numberOfHits: Double
    var hitRatio: Double {
        get{
            return numberOfHits / numberOfAtBats
        }
    }
    
    var onBaseDict = [Int: Player]()
    
    init (name: String, team1 isOnTeam1: Bool) {

        self.playerName = name
        self.isOnTeam1 = isOnTeam1
        self.numberOfAtBats = 0
        self.numberOfHits = 0

    }
    
    func toString() -> String{
        return self.playerName + " " + "is on team 1" + "and has a batting average of " + (String)(self.hitRatio)
    }
    
}