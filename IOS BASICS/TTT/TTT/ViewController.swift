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
        reset()
    }
    
    var player = "Red"
    
    @IBOutlet weak var b1: UIButton!
    @IBAction func b1(_ sender: UIButton) {
        switchColor(sender: sender)
    }
    
    @IBOutlet weak var b2: UIButton!
    @IBAction func b2(_ sender: UIButton) {
        switchColor(sender: sender)
    }
    
    @IBOutlet weak var b3: UIButton!
    @IBAction func b3(_ sender: UIButton) {
        switchColor(sender: sender)
    }
    
    @IBOutlet weak var b4: UIButton!
    @IBAction func b4(_ sender: UIButton) {
        switchColor(sender: sender)
    }
    
    @IBOutlet weak var b5: UIButton!
    @IBAction func b5(_ sender: UIButton) {
        switchColor(sender: sender)
    }
    
    @IBOutlet weak var b6: UIButton!
    @IBAction func b6(_ sender: UIButton) {
        switchColor(sender: sender)
    }
    
    @IBOutlet weak var b7: UIButton!
    @IBAction func b7(_ sender: UIButton) {
        switchColor(sender: sender)
    }
    
    @IBOutlet weak var b8: UIButton!
    @IBAction func b8(_ sender: UIButton) {
        switchColor(sender: sender)
    }
    
    @IBOutlet weak var b9: UIButton!
    @IBAction func b9(_ sender: UIButton) {
        switchColor(sender: sender)
    }
    
    
    @IBAction func bReset(_ sender: Any) {
        reset()
    }
    
    @IBOutlet weak var lblWon: UILabel!
    
    func checkWon(color: UIColor, won: String){
        if b1.backgroundColor == color && b2.backgroundColor == color && b3.backgroundColor == color {
            lblWon.text = "Congrate \(won) Won!"
        }else if b4.backgroundColor == color && b5.backgroundColor == color && b6.backgroundColor == color {
            
        }else if b7.backgroundColor == color && b8.backgroundColor == color && b9.backgroundColor == color {
            
        }else if b1.backgroundColor == color && b5.backgroundColor == color && b9.backgroundColor == color {
            
        }else if b3.backgroundColor == color && b5.backgroundColor == color && b7.backgroundColor == color {
            
        }
    }
    func reset(){
        b1.backgroundColor = UIColor.lightGray
        b2.backgroundColor = UIColor.lightGray
        b3.backgroundColor = UIColor.lightGray
        b4.backgroundColor = UIColor.lightGray
        b5.backgroundColor = UIColor.lightGray
        b6.backgroundColor = UIColor.lightGray
        b7.backgroundColor = UIColor.lightGray
        b8.backgroundColor = UIColor.lightGray
        b9.backgroundColor = UIColor.lightGray
    }
    func switchColor(sender : UIButton){
        if sender.backgroundColor == UIColor.lightGray{
            if player == "Red"{
                sender.backgroundColor = UIColor.red
                checkWon(color: UIColor.red, won: "Red")
                player = "Blue"
            }else{
                sender.backgroundColor = UIColor.blue
                checkWon(color: UIColor.red, won: "Blue")
                player = "Red"
            }
        }
    }
    
}

