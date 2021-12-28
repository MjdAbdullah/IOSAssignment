//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by admin on 28/12/2021.
//

import UIKit

class AddTaskViewController: UIViewController {

    weak var delegate: AddTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfDescription: UITextField!
    @IBOutlet weak var pDate: UIDatePicker!
    @IBAction func bAdd(_ sender: UIButton) {
        print("p")
        let title:String = tfTitle.text ?? "nil"
        let description:String = tfDescription.text ?? "nil"
        let date: Date = pDate.date
        let done = false
        delegate?.itemSaved(title: title, description: description, date: date, done: done)
    }
    
}
