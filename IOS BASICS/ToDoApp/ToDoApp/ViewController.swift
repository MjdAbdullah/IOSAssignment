//
//  ViewController.swift
//  ToDoApp
//
//  Created by admin on 21/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
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
    // add new task
    func createTask(title: String, description: String, date: Date, done: Bool){
        let newTask = TaskEntity(context: context)
        newTask.title = title
        newTask.descrption = description
        newTask.date = date
        do{
            try context.save()
            // update the list in the table view
            getAllTask()
        }catch{
            print("Can't add new Item")
        }
    }

}

extension ViewController : AddTaskDelegate {
    func itemSaved(title: String, description: String, date: Date, done: Bool) {
        createTask(title: title, description: description, date: date, done: done)
        dismiss(animated: true, completion: nil)
    }
}

