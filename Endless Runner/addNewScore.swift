//
//  addNewScore.swift
//  Endless Runner
//
//  Created by Karl Karlson on 4/29/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class addNewScore{
    
    var ref = Database.database().reference()
    var currentUser = Auth.auth().currentUser
    var newScore:Int
    var localScores: [Int]  = []
    
    init (_newScore:Int){
        newScore = _newScore
    }
    
    class func create(_newScore:Int)->addNewScore{
        return addNewScore(_newScore:_newScore)
    }
    
func addNew(){
    let ref = Database.database().reference()
    let currentUser = Auth.auth().currentUser
    
    var tempScore = newScore

    
    var betterUser:String = "-"
    var betterScore:Int = 0
    
    

    self.ref.child("UserData").child((currentUser?.uid)!).child("Name").observeSingleEvent(of: .value, with: {(snapshot) in
        let value = snapshot.value as? NSDictionary
        let name = value?["username"] as? String
        var tempUser = ""
        if let checkName = name{
            tempUser = checkName
        }
        
        self.ref.child("Leaderboard").observeSingleEvent(of: .value, with: {(snapshot) in
            
            let value = snapshot.value as? NSDictionary
            var scoreTop = value?["Top Score"] as? Int
            var userTop = value?["Top Player"] as? String
            if scoreTop != nil {
                if scoreTop! < tempScore{
                    betterScore = scoreTop!
                    betterUser = userTop!
                    scoreTop = tempScore
                    userTop = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                var scoreSecond = value?["Second Best"] as? Int
                var userSecond = value?["Second Player"] as? String
                if scoreSecond! < tempScore{
                    betterScore = scoreSecond!
                    betterUser = userSecond!
                    scoreSecond = tempScore
                    userSecond = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                var scoreThird = value?["Third Best"] as? Int
                var userThird = value?["Third Player"] as? String
                if scoreThird! < tempScore{
                    betterScore = scoreThird!
                    betterUser = userThird!
                    scoreThird = tempScore
                    userThird = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                var scoreForth = value?["Forth Best"] as? Int
                var userForth = value?["Forth Player"] as? String
                if scoreForth! < tempScore{
                    betterScore = scoreForth!
                    betterUser = userForth!
                    scoreForth = tempScore
                    userForth = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                var scoreFifth = value?["Fifth Best"] as? Int
                var userFifth = value?["Fifth Player"] as? String
                if scoreFifth! < tempScore{
                    betterScore = scoreFifth!
                    betterUser = userFifth!
                    scoreFifth = tempScore
                    userFifth = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                var scoreSixth = value?["Sixth Best"] as? Int
                var userSixth = value?["Sixth Player"] as? String
                if scoreSixth! < tempScore{
                    betterScore = scoreSixth!
                    betterUser = userSixth!
                    scoreSixth = tempScore
                    userSixth = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                var scoreSeventh = value?["Seventh Best"] as? Int
                var userSeventh = value?["Seventh Player"] as? String
                if scoreSeventh! < tempScore{
                    betterScore = scoreSeventh!
                    betterUser = userSeventh!
                    scoreSeventh = tempScore
                    userSeventh = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                var scoreEighth = value?["Eighth Best"] as? Int
                var userEighth = value?["Eighth Player"] as? String
                if scoreEighth! < tempScore{
                    betterScore = scoreEighth!
                    betterUser = userEighth!
                    scoreEighth = tempScore
                    userEighth = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                var scoreNinth = value?["Ninth Best"] as? Int
                var userNinth = value?["Ninth Player"] as? String
                if scoreNinth! < tempScore{
                    betterScore = scoreNinth!
                    betterUser = userNinth!
                    scoreNinth = tempScore
                    userNinth = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                var scoreTenth = value?["Tenth Best"] as? Int
                var userTenth = value?["Tenth Player"] as? String
                if scoreTenth! < tempScore{
                    betterScore = scoreTenth!
                    betterUser = userTenth!
                    scoreTenth = tempScore
                    userTenth = tempUser
                    tempScore = betterScore
                    tempUser = betterUser
                }
                
                let globalPost:[String:Any]  = ["Top Score": scoreTop, "Top Player": userTop, "Second Best": scoreSecond, "Second Player": userSecond, "Third Best": scoreThird,"Third Player": userThird,"Forth Best": scoreForth,"Forth Player": userForth,"Fifth Best": scoreFifth,"Fifth Player": userFifth,"Sixth Best": scoreSixth,"Sixth Player": userSixth,"Seventh Best": scoreSeventh,"Seventh Player": userSeventh,"Eighth Best": scoreEighth,"Eighth Player": userEighth,"Ninth Best": scoreNinth,"Ninth Player": userNinth,"Tenth Best":scoreTenth,"Tenth Player": userTenth]
                ref.child("Leaderboard").setValue(globalPost)
            }
            else{
                let globalPost:[String:Any]  = ["Top Score": 0, "Top Player": "-", "Second Best": 0, "Second Player": "-", "Third Best": 0,"Third Player": "-","Forth Best": 0,"Forth Player": "-","Fifth Best": 0,"Fifth Player": "-","Sixth Best": 0,"Sixth Player": "-","Seventh Best": 0,"Seventh Player": "-","Eighth Best": 0,"Eighth Player": "-","Ninth Best": 0,"Ninth Player": "-","Tenth Best":0,"Tenth Player": "-"]
                ref.child("Leaderboard").setValue(globalPost)
            }
            
            
        })
    })
    
    
    ref.child("UserData").child((currentUser?.uid)!).child("Scores").observeSingleEvent(of: .value, with: {(snapshot) in
        
        var value = snapshot.value as? NSDictionary
        var score = value?["Top Score"] as? Int
        if score != nil {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Second Best"] as? Int
        if score != nil {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Third Best"] as? Int
        if score != nil {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Forth Best"] as? Int
        if score != nil {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Fifth Best"] as? Int
        if score != nil {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Sixth Best"] as? Int
        if score != nil {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Seventh Best"] as? Int
        if score != nil{
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Eighth Best"] as? Int
        if score != nil{
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Ninth Best"] as? Int
        if score != nil {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Tenth Best"] as? Int
        if score != nil{
            self.localScores.append(score!)
        }
        print(self.localScores)
        self.localScores.append(self.newScore)
        self.localScores.sort()
        self.localScores.reverse()
        print(self.localScores)
        
        let post = ["Top Score": self.localScores[0],"Second Best": self.localScores[1],"Third Best": self.localScores[2],"Forth Best": self.localScores[3],"Fifth Best": self.localScores[4],"Sixth Best": self.localScores[5],"Seventh Best": self.localScores[6],"Eighth Best": self.localScores[7],"Ninth Best": self.localScores[8],"Tenth Best":self.localScores[9]]
        
        ref.child("UserData").child((currentUser?.uid)!).child("Scores").setValue(post)})

    }}




