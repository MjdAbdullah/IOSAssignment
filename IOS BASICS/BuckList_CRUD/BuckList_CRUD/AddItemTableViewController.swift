//
//  AddItemTableViewController.swift
//  BuckList_CRUD
//
//  Created by admin on 19/12/2021.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    weak var delegate: AddItemDelegate?
    var itemEdit: String?
    var indexPath: NSIndexPath?

    @IBOutlet weak var tfItem: UITextField!
    @IBAction func bCancel(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    @IBAction func bSave(_ sender: UIBarButtonItem) {
        let text = tfItem.text
        delegate?.itemSaved(by: self, with: text!, at: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // both optional
        tfItem.text = itemEdit
    }
    
    override func didReceiveMemoryWarning() {
        
    }

}
