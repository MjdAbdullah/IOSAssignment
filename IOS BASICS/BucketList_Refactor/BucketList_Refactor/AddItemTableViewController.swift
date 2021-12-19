//
//  AddItemTableViewController.swift
//  BucketList_Refactor
//
//  Created by admin on 19/12/2021.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    weak var delegate: AddItemDelegate?
    var itemEdit: String?
    var indexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfText.text = itemEdit
    }
    @IBOutlet weak var tfText: UITextField!
    @IBAction func bCancel(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    @IBAction func bSave(_ sender: UIBarButtonItem) {
        let text = tfText.text
        delegate?.itemSaved(by: self, with: text!, at: indexPath)
    }
    
    
}
