//
//  ViewController.swift
//  LoginApp
//
//  Created by Eugene on 4.11.22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let username = "User"
    private let password = "12345"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }

        welcomeVC.username = usernameTF.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        let alertMessage = UIAlertController(title: "Reminder",
                                             message: "Your username is \(username)",
                                             preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        let fill = UIAlertAction(title: "Fill",
                                 style: .destructive) { _ in
            self.usernameTF.text = self.username
        }
        
        alertMessage.addAction(ok)
        alertMessage.addAction(fill)
        
        self.present(alertMessage, animated: true)
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        let alertMessage = UIAlertController(title: "Reminder",
                                             message: "Your password is \(password)",
                                             preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        let fill = UIAlertAction(title: "Fill",
                                 style: .destructive) { _ in
            self.passwordTF.text = self.password
        }
        
        alertMessage.addAction(ok)
        alertMessage.addAction(fill)
        
        self.present(alertMessage, animated: true)
    }
    
    @IBAction func loginButtonTapped() {
        if usernameTF.text != username || passwordTF.text != password {
            let alertMessage = UIAlertController(title: "Error",
                                                 message: "Wrong username or password!",
                                                 preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default)
            
            alertMessage.addAction(ok)
            
            self.present(alertMessage, animated: true)
        }
    }
}
