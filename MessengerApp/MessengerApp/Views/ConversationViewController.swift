//
//  ConversationViewController.swift
//  MessengerApp
//
//  Created by admin on 30/12/2021.
//

import UIKit
import FirebaseDatabase

class ConversationViewController: UIViewController {
    // check to see if user is signed in using ... user defaults
    // they are, stay on the screen. If not, show the login screen
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //to add new user need to:
        // 1- creat firebase refrence
        // 2- get all user dictionary
        // 3- update user dictionary with anther user object
        // 4- send the udate user dictionary to firebase
        
        // database refrense
        
        // Defults user
        let isLoggedIn = UserDefaults.standard.bool(forKey: "")
        if !isLoggedIn {
            // present login view controller
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
