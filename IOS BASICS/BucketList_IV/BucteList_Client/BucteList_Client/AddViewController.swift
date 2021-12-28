//
//  AddViewController.swift
//  BucteList_Client
//
//  Created by admin on 28/12/2021.
//

import UIKit

protocol AddDelegate{
    
}

class AddViewController: UIViewController {
    
    var delegate: ViewController?
    var taskEdit:  NSDictionary?
    var idex: IndexPath? 

    @IBOutlet weak var tvText: UITextField!
    @IBAction func bAdd(_ sender: UIButton) {
        let newText = tvText.text!
        if taskEdit != nil {
            taskEdit?.setValue(newText, forKey: "objective")
            TaskModel.updateTask(task: taskEdit!, completionHandler: {
                data, response, error in
                if data != nil {
                    do {
                        let task = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        DispatchQueue.main.async {
                            self.delegate?.tasks[self.idex!.row] = task
                            self.delegate?.tableView.reloadData()
                            self.taskEdit = nil 
                            let _ = self.navigationController?.viewControllers.popLast()
                        }
                    }catch {
                        print("error \(error)")
                    }
                }
            })
        }else {
            TaskModel.addTask(objective: newText, completionHandler: {
                data, response, error in
                if data != nil {
                    do{
                        let task = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        DispatchQueue.main.async {
                            self.delegate?.tasks.append(task)
                            self.delegate?.tableView.reloadData()
                            let _ = self.navigationController?.viewControllers.popLast()
                        }
                    }catch {
                        print("Error \(error)")
                    }
                }
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("ww")
        tvText.text = taskEdit?.value(forKey: "objective") as? String
        
    }
    

}
