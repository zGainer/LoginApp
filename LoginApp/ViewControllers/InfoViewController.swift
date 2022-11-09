//
//  InfoViewController.swift
//  LoginApp
//
//  Created by Eugene on 9.11.22.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var workLabel: UILabel!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
    }
    
    private func fillData() {
        guard let person = person else { return }
        
        nameLabel.text = "Name: \(person.name)"
        surnameLabel.text = "Surname: \(person.surname)"
        ageLabel.text = "Age: \(person.age)"
        workLabel.text = "Work: \(person.work)"
    }
}
