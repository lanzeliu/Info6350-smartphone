//
//  ViewController.swift
//  LoginAssignment
//
//  Created by Liu Lanze on 11/14/20.
//

import UIKit
import Firebase
import SwiftSpinner
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    // Create new user attributes
    @IBOutlet weak var txtSignUpEmail: UITextField!
    @IBOutlet weak var txtSignUpPassword: UITextField!
    @IBOutlet weak var lblSignUpStatus: UILabel!
    
    // Password reset email attributes
    @IBOutlet weak var lblPasswordResetEmailStatus: UILabel!
    @IBOutlet weak var txtPasswordResetEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginFunction(_ sender: Any) {
        
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter a valid email"
            return
        }
        
        SwiftSpinner.show("Logging in......")
        Auth.auth().signIn(withEmail: email!, password: password!) { [weak self] authResult, error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            
            self?.txtPassword.text = ""
            
            self!.performSegue(withIdentifier: "loginSegue", sender: strongSelf)
        }
    }
    
    
    @IBAction func signUpFunction(_ sender: Any) {
        
        let email = txtSignUpEmail.text
        let password = txtSignUpPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
        }
        
        if email?.isEmail == false {
            lblStatus.text = "Please enter a valid email"
            return
        }
        
        SwiftSpinner.show("Signning Up......")
        Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
            SwiftSpinner.hide()
            
            if error == nil {
                self.lblSignUpStatus.text = "Sign up successfully!"
            }
        }
    }
    
    @IBAction func passwordResetEmailFunction(_ sender: Any) {
        let email = txtPasswordResetEmail.text
        
        if email?.isEmail == false {
            lblStatus.text = "Please enter a valid email!"
            return
        }
        
        SwiftSpinner.show("Password Reset Email Sending......")
        Auth.auth().sendPasswordReset(withEmail: email!) { error in
            SwiftSpinner.hide()
            
            if error == nil {
                self.lblPasswordResetEmailStatus.text = "Password reset email has been sent successfully!"
            }
        }
    }
    
    
}

