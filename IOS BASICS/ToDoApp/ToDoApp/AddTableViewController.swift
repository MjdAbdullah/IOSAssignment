//
//  AddTableViewController.swift
//  ToDoApp
//
//  Created by admin on 21/12/2021.
//

import UIKit

class AddTableViewController: UITableViewController {
    
    weak var delegate: AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfDescription: UITextField!
    @IBAction func bCancel(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    @IBAction func bSave(_ sender: UIBarButtonItem) {
        
    }
    
    
}
