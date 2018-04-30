//
//  CreateUserNameViewController.swift
//  Endless Runner
//
//  Created by Karl Karlson on 4/28/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CreateUserNameViewController: UIViewController {
    @IBOutlet weak var UserNameTextField: UITextField!
    var ref = Database.database().reference()
    var currentUser = Auth.auth().currentUser
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Test
}
    @IBAction func SelectUserNameButton(_ sender: Any) {
        if UserNameTextField.text == ""  {
            let alert = UIAlertController(title: "Error", message: "You must enter a User Name", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion:nil)
        }
        else if UserNameTextField.text!.count > 14{
            let alert = UIAlertController(title: "Error", message: "Select a User Name with less than 14 Characters", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion:nil)        }
        else{
            let post1 = ["username": UserNameTextField.text]
            let post2 = ["Top Score": 9,"Second Best": 8,"Third Best": 7,"Forth Best": 6,"Fifth Best": 5,"Sixth Best": 4,"Seventh Best": 3,"Eighth Best": 2,"Ninth Best": 1,"Tenth Best":0]
            self.ref.child("UserData").child((currentUser?.uid)!).child("Name").setValue(post1)
            self.ref.child("UserData").child((currentUser?.uid)!).child("Scores").setValue(post2)
            self.performSegue(withIdentifier: "goToMainFromCreateUserName", sender: self)
        }
    }
}
