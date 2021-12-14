//
//  ViewController.swift
//  MadLibs
//
//  Created by admin on 13/12/2021.
//

import UIKit

class ViewController: UIViewController, valueChange {
    
    
    func value(adj: String, verb: String, verb2: String, none: String) {
        
        lblText.isHidden = false
        lblText.text = "We are having a perfecty \(adj) time now. Later we will \(verb) and \(verb2) in the \(none)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func bEdit(_ sender: UIButton) {
        let secandCv = storyboard?.instantiateViewController(withIdentifier: "secand") as! SecandViewController
        secandCv.valueDelegate = self
        present(secandCv, animated: true, completion: nil)
    }
    @IBOutlet weak var lblText: UILabel!
    
}

