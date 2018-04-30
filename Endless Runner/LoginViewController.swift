//
//  ViewController.swift
//  Endless Runner
//
//  Created by Karl Karlson on 3/27/18.
//  Copyright © 2018 Brennan Stewart. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    var ref : DatabaseReference!
    
    
    override func viewDidLoad() {
        ref = Database.database().reference()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInUser(_ sender: Any) {
        
        if userEmail.text == "" || userPassword.text == ""{
            let alert = UIAlertController(title: "Error", message: "You must enter a value for all fields", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion:nil)
        }
        else{
            Auth.auth().signIn(withEmail: userEmail.text!, password: userPassword.text!) { (user, error) in
                
                if error == nil {

                    self.performSegue(withIdentifier: "goToMain", sender: self)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
            }
        }
        }
    
    
    @IBAction func createNewUser(_ sender: Any) {
        if userEmail.text == "" || userPassword.text == ""{
            let alert = UIAlertController(title: "Error", message: "You must enter a value for all fields", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion:nil)
        }
        else{
            Auth.auth().createUser(withEmail: userEmail.text!, password: userPassword.text!) { (user, error) in
                
                if error == nil {

                   self.performSegue(withIdentifier: "goToCreateUserName", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    }
            }
        }
    }
    
    @IBAction func resetPasswordButton(_ sender: Any) {
        if userEmail.text == "" {
            let alert = UIAlertController(title: "Error", message: "You must enter an email", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion:nil)
        }
        else {
            Auth.auth().sendPasswordReset(withEmail: self.userEmail.text!, completion: { (error) in
                if error != nil {
                    let message = (error?.localizedDescription)!
                    let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                    alert.addAction(OKAction)
                    self.present(alert, animated: true, completion:nil)
                }
                
            })
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

