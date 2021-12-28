//
//  ViewController.swift
//  BucteList_Client
//
//  Created by admin on 27/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewC = segue.destination as! AddViewController
        viewC.delegate = self
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

