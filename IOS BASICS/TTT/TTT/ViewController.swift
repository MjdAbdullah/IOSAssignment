//
//  ViewController.swift
//  TTT
//
//  Created by admin on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var player = "Red"
    var button = ""
    
    @IBOutlet weak var b1: UIButton!
    @IBAction func b1(_ sender: UIButton) {
        if sender.backgroundColor == UIColor.lightGray{
            if player == "Red"{
                sender.backgroundColor = UIColor.red
                player = "Blue"
            }else{
                sender.backgroundColor = UIColor.blue
                player = "Red"
            }
        }
    }
    
    @IBOutlet weak var b2: UIButton!
    @IBAction func b2(_ sender: UIButton) {
        
    }
    
    @IBAction func b3(_ sender: Any) {
    }
    
    @IBAction func b4(_ sender: Any) {
    }
    
    @IBAction func b5(_ sender: Any) {
    }
    
    @IBAction func b6(_ sender: Any) {
    }
    
    @IBAction func b7(_ sender: Any) {
    }
    
    @IBAction func b8(_ sender: Any) {
    }
    
    @IBAction func b9(_ sender: Any) {
    }
    
    
    @IBAction func bReset(_ sender: Any) {
        b1.backgroundColor = UIColor.lightGray
    }
}

