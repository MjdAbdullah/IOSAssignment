//
//  LoginViewController.swift
//  MessengerApp
//
//  Created by admin on 30/12/2021.
//

import UIKit
import FirebaseDatabase
import Firebase

class LoginViewController: UIViewController {
    
    // field Email address
    @IBOutlet weak var fEmail: UITextField!
    // field pasword
    @IBOutlet weak var fPassword: UITextField!
    // button log in
    @IBAction func bLogIn(_ sender: Any) {
        if let email = fEmail.text, let password = fPassword.text {
            checkUser(email: email, password: password)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Log In"
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
    }
    
    func checkUser(email: String, password: String){
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] authResult, error in
            guard let strongSelf = self else {
                return
            }
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email \(email)")
                return
            }
            let user = result.user
            print("logged in user: \(user)")
            // if this succeeds, dismiss
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        })
    }

}
