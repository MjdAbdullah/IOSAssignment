//
//  ViewController.swift
//  BucteList_Client
//
//  Created by admin on 27/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfNewTask: UITextField!
    @IBAction func bAdd(_ sender: Any) {
        print("here")
        if let newTask = tfNewTask.text {
            print("here")
            TaskModel.addTask(objective: newTask, completion: {
                data, response, error in
                if data != nil {
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        DispatchQueue.main.async {
                            self.getData()
                        }
                    }catch {
                        print("error: \(error)")
                    }
                }
            })
        }
    }
    
    
    var tasks = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        getData()
        
    }
    
    func getData(){
        TaskModel.getAllTasks() {
                   data, response, error in
                   do {
                       if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
                           for task in jsonResult {
                               let taskDict = task as! NSDictionary
                               self.tasks.append(taskDict)
                           }
                       }
                       DispatchQueue.main.async {
                           self.tableView.reloadData()
                       }
                   } catch {
                       print("Something went wrong")
                   }
               }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]["objective"] as? String
        return cell
    }


}

