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
    var ref = Database.database().reference()
    var currentUser = Auth.auth().currentUser
    
    var userName =  ""
    self.ref.child("UserData").child((currentUser?.uid)!).child("Name").observeSingleEvent(of: .value, with: {(snapshot) in
        let value = snapshot.value as? NSDictionary
        let name = value?["username"] as? String
        if let checkName = name{
            userName = checkName
        }
        
        
    })
    
    ref.child("UserData").child((currentUser?.uid)!).child("Scores").observeSingleEvent(of: .value, with: {(snapshot) in
        
        var value = snapshot.value as? NSDictionary
        var score = value?["Top Score"] as? Int
        if let checkScore = score {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Second Best"] as? Int
        if let checkScore = score {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Third Best"] as? Int
        if let checkScore = score {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Forth Best"] as? Int
        if let checkScore = score {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Fifth Best"] as? Int
        if let checkScore = score {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Sixth Best"] as? Int
        if let checkScore = score {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Seventh Best"] as? Int
        if let checkScore = score {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Eighth Best"] as? Int
        if let checkScore = score {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Ninth Best"] as? Int
        if let checkScore = score {
            self.localScores.append(score!)
        }
        
        value = snapshot.value as? NSDictionary
        score = value?["Tenth Best"] as? Int
        if let checkScore = score {
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




