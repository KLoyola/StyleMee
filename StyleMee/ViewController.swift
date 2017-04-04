//
//  ViewController.swift
//  StyleMee
//
//  Created by Kevin Loyola on 3/26/17.
//  Copyright © 2017 Kevin Loyola. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn:Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
    
        // Flip the Boolean
        isSignIn = !isSignIn
        
        
        //Check the Bool and set the button and labels
        if isSignIn {
            signInLabel.text = " Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        }
        else{
            signInLabel.text = " Register"
            signInButton.setTitle("Register", for: .normal)
        }
        
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
   
     if let email = emailTextField.text, let pass = passwordTextField.text
     {
        //Check if its sign in or register
        if isSignIn {
            // Sign In user with FireBase
            FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                
                //Check that user isint nill
                if user != nil {
                    //User is found, go to homescreen
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                    
                }
                else{
                    //Error: check error and show message
                    
                }
                
                
            })
        }
        else {
            //Register with Firebase
            
            FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                
                // Check that user isint nill
                if user != nil{
                    // user is found go to homescreen
                    self.performSegue(withIdentifier: "goToHome", sender: self)

            }
                else{
                    // Error: Check error and show message
                }
            })
        
        }
        
    }
}
        
        
        
        


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Dismiss the keyboard when the view is tapped on
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}
