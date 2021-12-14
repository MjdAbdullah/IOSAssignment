//
//  ViewController.swift
//  North_East
//
//  Created by admin on 13/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func bEast(_ sender: UIButton) {
        let vcSecond = storyboard?.instantiateViewController(withIdentifier: "secand") as! SecandViewController
        vcSecond.message = "East"
        present(vcSecond, animated: true, completion: nil)
        
    }
    @IBAction func bSouth(_ sender: UIButton) {
        let vcSecond = storyboard?.instantiateViewController(withIdentifier: "secand") as! SecandViewController
        vcSecond.message = "South"
        present(vcSecond, animated: true, completion: nil)
    }
    @IBAction func bNoth(_ sender: UIButton) {
        let vcSecond = storyboard?.instantiateViewController(withIdentifier: "secand") as! SecandViewController
        vcSecond.message = "Noth"
        present(vcSecond, animated: true, completion: nil)
    }
    @IBAction func bWest(_ sender: UIButton) {
        let vcSecond = storyboard?.instantiateViewController(withIdentifier: "secand") as! SecandViewController
        vcSecond.message = "West"
        present(vcSecond, animated: true, completion: nil)
    }
    
    
}

