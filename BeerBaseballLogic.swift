//
//  BeerBaseballLogic.swift
//  Beer Baseball
//
//  Created by Rob Kiernan on 5/24/16.
//  Copyright © 2016 Rob Kiernan. All rights reserved.
//

import Foundation
class BeerBaseballLogic {
    
    let NUMBER_OF_INNINGS = 7

      //Hard Coded arrays if necessary
//    var team1Array: Array<Player> = [
//        Player(name: "Rob", team1: true),
//        Player(name:"Tim", team1: true),
//        Player(name: "Emily", team1: true),
//        Player(name: "Ben", team1: true)]
//    var team2Array: Array<Player> = [
//        Player(name: "Colleen", team1: false),
//        Player(name:"Chris", team1: false),
//        Player(name: "Paul", team1: false),
//        Player(name: "Eileen", team1: false)]
    
    //PROPERTIES
    var team1Array = Array<Player>()
    var team2Array = Array<Player>()
    
    var teamName1 = "Team 1", teamName2 = "Team 2"
    var playerAtBat1, playerOnDeck1: Player?
    var playerAtBat2, playerOnDeck2: Player?
    var currentInning = 1, numberOfOuts = 0
    var team1IsAtBat: Bool = true
    var team1Score = 0, team2Score = 0
    var playerNumberAtBat1 = 0, playerNumberOnDeck1 = 1
    var playerNumberAtBat2 = 0, playerNumberOnDeck2 = 1
    var onBaseArray = Array<Player?>()
    
    func gotOut() {
        
        numberOfOuts += 1
        
        if team1IsAtBat {
            team1Array[playerNumberAtBat1].numberOfAtBats += 1
        } else {
            team2Array[playerNumberAtBat2].numberOfAtBats += 1
        }
        
        if numberOfOuts == 3 {
            if !(team1IsAtBat) {
                currentInning += 1
                numberOfOuts = 0
            }
            numberOfOuts = 0
            setNextPlayerAtBat()
            setNextPlayerOnDeck()
            team1IsAtBat = !(team1IsAtBat)
        }else{
            setNextPlayerAtBat()
            setNextPlayerOnDeck()
        }
    } //end gotOut()
    
    func homeRun() {
        
        if team1IsAtBat {
            team1Score += 1
            team1Array[playerNumberAtBat1].numberOfAtBats += 1
            team1Array[playerNumberAtBat1].numberOfHits += 1
        } else {
            team2Score += 1
            team2Array[playerNumberAtBat2].numberOfAtBats += 1
            team2Array[playerNumberAtBat2].numberOfHits += 1
        }
        
        print("Team 1 Score:")
        print(team1Score)
        print("Team 2 Score:")
        print(team2Score)
        
    }
    
    func baseRun(base: Int) {
        
        var playerAtBat: Player
        
        if team1IsAtBat {
            team1Array[playerNumberAtBat1].numberOfAtBats += 1
            team1Array[playerNumberAtBat1].numberOfHits += 1
            playerAtBat = team1Array[playerNumberAtBat1]
        } else {
            team2Array[playerNumberAtBat2].numberOfAtBats += 1
            team2Array[playerNumberAtBat2].numberOfHits += 1
            playerAtBat = team2Array[playerNumberAtBat1]
        }

        
        switch base {
        case 1:
            calculateBaseRun(1)
            print("\(playerAtBat.playerName) Hit A Single!")
        case 2:
            calculateBaseRun(2)
            print ("\(playerAtBat.playerName) Hit A Double!")
        case 3:
            calculateBaseRun(3)
            print("\(playerAtBat.playerName) Hit A Triple!")
        default:
            print("This should not print")
        }
        
        setNextPlayerAtBat()
        setNextPlayerOnDeck()
        
    }
    
    func calculateBaseRun(base: Int) {
        
        var playerOnFirst: Player? = onBaseArray[0]
        var playerOnSecond: Player? = onBaseArray[1]
        var playerOnThird: Player? = onBaseArray[2]
       
        
        
        print(playerOnFirst?.playerName)
        print(playerOnSecond?.playerName)
        print(playerOnThird?.playerName)
        
        
    }
    
    func setNextPlayerAtBat() {
        if team1Array.count != 0 && team2Array.count != 0 {
            if team1IsAtBat {
                if playerNumberAtBat1 == (team1Array.count - 1) {
                    playerNumberAtBat1 = 0
                    playerAtBat1 = team1Array[playerNumberAtBat1]
                    print("setNextPlayerAtBat() called for team 1 and is changing index to 0")
                } else {
                    playerNumberAtBat1 += 1
                    playerAtBat1 = team1Array[playerNumberAtBat1]
                    print("setNextPlayerAtBat() called for team 1 and is increasing to index \(playerNumberAtBat1)")
                }
            } else {
                if playerNumberAtBat2 == (team2Array.count-1) {
                    playerNumberAtBat2 = 0
                    playerAtBat2 = team2Array[playerNumberAtBat2]
                    print("setNextPlayerAtBat() called for team 2 and is changing index to 0")
                } else {
                    playerNumberAtBat2 += 1
                    playerAtBat2 = team2Array[playerNumberAtBat2]
                    print("setNextPlayerAtBat() called for team 2 and is increasing to index \(playerNumberAtBat2)")
                }
            }
        } //end check arrays for values
    } //end of setNextPlayerAtBat
    
    func setNextPlayerOnDeck() {
        if team1Array.count != 0 && team2Array.count != 0 {
            if team1IsAtBat {
                if playerNumberOnDeck1 == (team1Array.count - 1) {
                    playerNumberOnDeck1 = 0
                    playerOnDeck1 = team1Array[playerNumberOnDeck1]
                    print("setNextPlayerOnDeck() called for team 1 and is changing index to 0")
                } else {
                    playerNumberOnDeck1 += 1
                    playerOnDeck1 = team1Array[playerNumberOnDeck1]
                    print("setNextPlayerOnDeck() called for team 1 and is increasing to index \(playerNumberOnDeck1)")
                }
            } else {
                if playerNumberOnDeck2 == (team2Array.count-1) {
                    playerNumberOnDeck2 = 0
                    playerOnDeck2 = team2Array[playerNumberOnDeck2]
                    print("setNextPlayerOnDeck() called for team 2 and is changing index to 0")
                } else {
                    playerNumberOnDeck2 += 1
                    playerOnDeck2 = team2Array[playerNumberOnDeck2]
                    print("setNextPlayerOnDeck() called for team 2 and is increasing to index \(playerNumberOnDeck2)")
                }
            }
        } //end check for array values

    }
    
    func getPlayerAtBat() -> String {
        if team1Array.count != 0 && team2Array.count != 0 {
            if team1IsAtBat{
                return team1Array[playerNumberAtBat1].playerName
            } else {
                return team2Array[playerNumberAtBat2].playerName
            }
        } else if team1Array.count == 0 {
            print("array 1 has no members")
            return "player"
        } else if team2Array.count == 0 {
            print("array 2 has no members")
            return "player"
        } else {return "player"}
    }
    
    func getPlayerOnDeck() -> String {
        if team1Array.count != 0 && team2Array.count != 0 {
            if team1IsAtBat {
                return team1Array[playerNumberOnDeck1].playerName
            } else {
                return team2Array[playerNumberOnDeck2].playerName
            }
        } else if team1Array.count == 0 {
            print("array 1 has no members")
            return "player"
        } else if team2Array.count == 0 {
            print("array 2 has no members")
            return "player"
        } else { return "player"}
    }
    
    func getBattingAverage() -> String {
        

        if team1Array.count != 0 && team2Array.count != 0 {
            if team1IsAtBat{
                if team1Array[playerNumberAtBat1].numberOfAtBats != 0 {
                    return (String)(team1Array[playerNumberAtBat1].hitRatio)
                } else {
                    return "No At Bats"
                }
            } else {
                if team2Array[playerNumberAtBat2].numberOfAtBats != 0 {
                    return (String)(team2Array[playerNumberAtBat2].hitRatio)
                } else {
                    return "No At Bats"
                }
                
            }
        } else if team1Array.count == 0 {
            print("array 1 has no members")
            return "n/a"
        } else if team2Array.count == 0 {
            print("array 2 has no members")
            return "n/a"
        } else {return "n/a"}
    
    }//end getBattingAverage

    
}