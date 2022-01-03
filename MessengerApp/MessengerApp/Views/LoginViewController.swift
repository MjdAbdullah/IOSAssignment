//
//  LoginViewController.swift
//  MessengerApp
//
//  Created by admin on 30/12/2021.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            
            scrollView.clipsToBounds = true
            return scrollView
        }()
        
        private let emailField: UITextField = {
            let field = UITextField()
            field.autocapitalizationType = .none
            field.autocorrectionType = .no
            field.returnKeyType = .continue
            field.layer.cornerRadius = 12
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor.lightGray.cgColor
            field.placeholder = "Email Address..."
            
            field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
            field.leftViewMode = .always
            field.backgroundColor = .white
            return field
        }()
        private let passwordField: UITextField = {
            let field = UITextField()
            field.autocapitalizationType = .none
            field.autocorrectionType = .no
            field.returnKeyType = .done
            field.layer.cornerRadius = 12
            field.layer.borderWidth = 1
            field.layer.borderColor = UIColor.lightGray.cgColor
            field.placeholder = "Password..."
            
            field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
            field.leftViewMode = .always
            field.backgroundColor = .white
            field.isSecureTextEntry = true
            return field
        }()

}
