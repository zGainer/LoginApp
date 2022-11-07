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

        welcomeVC.username = username
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        let alertMessage = getAlertController(title: "Reminder",
                                              message: "Your username is \(username)")

        let fill = UIAlertAction(title: "Fill",
                                 style: .destructive) { _ in
            self.usernameTF.text = self.username
        }
        
        alertMessage.addAction(fill)
        
        self.present(alertMessage, animated: true)
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        let alertMessage = getAlertController(title: "Reminder",
                                              message: "Your password is \(password)")

        let fill = UIAlertAction(title: "Fill",
                                 style: .destructive) { _ in
            self.passwordTF.text = self.password
        }
        
        alertMessage.addAction(fill)
        
        self.present(alertMessage, animated: true)
    }
    
    @IBAction func loginButtonTapped() {
        if usernameTF.text != username || passwordTF.text != password {
            let alertMessage = getAlertController(title: "Error",
                                                  message: "Wrong username or password!")
            
            self.present(alertMessage, animated: true)
            
            passwordTF.text = ""
        }
    }
    
    private func getAlertController(title: String, message: String) -> UIAlertController {
        let alertMessage = UIAlertController(title: title,
                                             message: message,
                                             preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alertMessage.addAction(ok)

        return alertMessage
    }
}
