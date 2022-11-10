//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Eugene on 5.11.22.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var greetingLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        greetingLabel.text = user.username
    }
}
