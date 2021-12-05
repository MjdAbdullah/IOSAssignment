//
//  ViewController.swift
//  Cold_Call2
//
//  Created by admin on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var lbelName: UILabel!
    @IBOutlet weak var lbelNumber: UILabel!
    let nameArray = [
            "Cody", "Jimmy", "Sara","Jay", "Uyanga","Bryant","Ryota","Courtney","Maha"
        ]
    var num : Int = 0
    @IBAction func bCall(_ sender: Any) {
        lbelName.text = nameArray[Random()]
        num = Int.random(in: 1..<6)
        lbelNumber.text = String(num)
        if num == 1 || num == 2 {
            lbelNumber.textColor = UIColor.red
        }else if num == 4 || num == 3 {
            lbelNumber.textColor = UIColor.orange
        }else{
            lbelNumber.textColor = UIColor.green
        }
    }
    
    func Random() -> Int{
        return Int.random(in: 0..<nameArray.count)
    }
    
}

