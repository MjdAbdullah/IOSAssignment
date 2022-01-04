//
//  LoginViewController.swift
//  MessengerApp
//
//  Created by admin on 30/12/2021.
//

import UIKit
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    // field Email address
    @IBOutlet weak var fEmail: UITextField!
    // field pasword
    @IBOutlet weak var fPassword: UITextField!
    // button log in
    @IBAction func bLogIn(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Log In"
    }

}
