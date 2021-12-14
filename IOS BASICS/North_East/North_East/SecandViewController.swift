//
//  SecandViewController.swift
//  North_East
//
//  Created by admin on 14/12/2021.
//

import UIKit

class SecandViewController: UIViewController {
    
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblText.text = message
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var lblText: UILabel!
    
}
