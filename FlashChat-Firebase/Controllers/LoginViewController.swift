//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Danila Bolshakov on 21/10/2019.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

final class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
        }
        }
    }
    
}
