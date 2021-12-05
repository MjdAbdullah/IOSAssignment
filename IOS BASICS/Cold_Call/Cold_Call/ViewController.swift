//
//  ViewController.swift
//  Cold_Call
//
//  Created by MJD on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var labelName: UILabel!
    
    let nameArray = [
        "Cody", "Jimmy", "Sara","Jay", "Uyanga","Bryant","Ryota","Courtney","Maha"
    ]
    
    @IBAction func bCall(_ sender: Any) {
        labelName.text = nameArray[Random()]
    }
    
    func Random() -> Int{
        return Int.random(in: 0..<nameArray.count)
    }
}

