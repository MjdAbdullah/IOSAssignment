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
    // check to see if user is signed in using ... user defaults
    // they are, stay on the screen. If not, show the login screen
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Log In"
        /*
         var ref: DatabaseReference!
         ref = Database.database().reference()
         */
        
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

extension LoginViewController {
    private func validateAuth(){
        // current user is set automatically when you log a user in
        if FirebaseAuth.Auth.auth().currentUser == nil {
            // present login view controller
            /**let vc = LoginViewController()
             vc.modalPresentationStyle = .fullScreen
             let nav = UINavigationController(rootViewController: vc)
             nav.modalPresentationStyle = .fullScreen
             present(nav, animated: true, completion: nil)*/
        }else{
            
        }
    }
}
