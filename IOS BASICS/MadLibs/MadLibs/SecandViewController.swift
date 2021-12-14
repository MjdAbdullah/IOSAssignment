//
//  SecandViewController.swift
//  MadLibs
//
//  Created by admin on 14/12/2021.
//

import UIKit
protocol valueChange{
    func value(adj:String, verb: String, verb2: String, none: String)
}

class SecandViewController: UIViewController{

    var valueDelegate: valueChange!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var tfAdjective: UITextField!
    @IBOutlet weak var tfVerb: UITextField!
    @IBOutlet weak var tfVerb2: UITextField!
    @IBOutlet weak var tfNone: UITextField!
    
    @IBAction func bSubmit(_ sender: UIButton) {
        if let adj = tfAdjective.text, let verb1 = tfVerb.text, let verb2 = tfVerb2.text, let none = tfNone.text{
            valueDelegate.value(adj: adj, verb: verb1, verb2: verb2, none: none)
            dismiss(animated: true, completion: nil)
        }
    }
    

}
