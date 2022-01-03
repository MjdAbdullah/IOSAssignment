//
//  RegisterViewController.swift
//  MessengerApp
//
//  Created by admin on 30/12/2021.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // field first name
    @IBOutlet weak var fFirstName: UITextField!
    // field last name
    @IBOutlet weak var fLastName: UITextField!
    // field email address
    @IBOutlet weak var fEmail: UITextField!
    // field password
    @IBOutlet weak var fPassword: UITextField!
    // button register
    @IBAction func bRegister(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Register"
    }

}
