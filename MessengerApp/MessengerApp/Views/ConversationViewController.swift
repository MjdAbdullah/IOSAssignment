//
//  ConversationViewController.swift
//  MessengerApp
//
//  Created by admin on 30/12/2021.
//

import UIKit
import FirebaseDatabase
import Firebase

class ConversationViewController: UIViewController {
    // check to see if user is signed in using ... user defaults
    // they are, stay on the screen. If not, show the login screen
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do {
            try FirebaseAuth.Auth.auth().signOut()
        }
        catch {
            print("somthing wrong")
        }
        DatabaseManger.shared.test() // call test!
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //to add new user need to:
        // 1- creat firebase refrence
        // 2- get all user dictionary
        // 3- update user dictionary with anther user object
        // 4- send the udate user dictionary to firebase
        
        // Defults user
        /*let isLoggedIn = UserDefaults.standard.bool(forKey: "")
        if !isLoggedIn {
            // present login view controller
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }*/
        
        validateAuth()
    }

    private func validateAuth(){
        // current user is set automatically when you log a user in
        if FirebaseAuth.Auth.auth().currentUser == nil {
            // present login view controller
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }

}
