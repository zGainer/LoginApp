//
//  DescriptionViewController.swift
//  LoginApp
//
//  Created by Eugene on 9.11.22.
//

import UIKit

class DescriptionViewController: UIViewController {
    @IBOutlet var descriptionLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = person.description
    }
}
