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
    
    private let user = User.getUserInfo()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let infoVC = viewController as? InfoViewController {
                infoVC.person = user.person
            } else if let descriptionVC = viewController as? DescriptionViewController {
                descriptionVC.person = user.person
            }
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Reminder", message: "Your username is \(user.username)")
            : showAlert(title: "Reminder", message: "Your password is \(user.password)")
    }
    
    @IBAction func loginButtonTapped() {
        guard usernameTF.text == user.username, passwordTF.text == user.password else {
            showAlert(title: "Error",
                      message: "Wrong username or password!",
                      textField: passwordTF)
            
            return
        }
        
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
