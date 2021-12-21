//
//  ViewController.swift
//  ToDoApp
//
//  Created by admin on 21/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddItemDelegate{
    
    let context = ( UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    struct Task {
        let title: String
        let date: Date
        let description: String
        var done: Bool
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    // save all task
    var taskList = [TaskEntity]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // for table view
        tableView.delegate = self
        tableView.dataSource = self
        // for get task list
        getAllTask()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func cancelButtonPressed(by controller: AddTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddTableViewController, titel: String, description: String, date: Date, done: Bool) {
        
    }
    
    // -----------------------------------------------------------------------
    // Core Data
    
    func getAllTask() {
        do{
            taskList = try context.fetch(TaskEntity.fetchRequest())
            tableView.reloadData()
        }catch{
            print("can't get data")
        }
    }
    
    

}

