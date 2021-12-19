//
//  ViewController.swift
//  BuckList_CRUD
//
//  Created by admin on 19/12/2021.
//

import UIKit

class BuckListViewController: UITableViewController, CancelButtonDelegate {
    
    var arr = ["1","2","3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let data = arr[indexPath.row]
        cell.textLabel?.text = data
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nController = segue.destination as! UINavigationController
        let addItemTableController = nController.topViewController as! AddItemTableViewController
        addItemTableController.delegate = self
    }
    
    func cancelButtonPressed(by controller: UIViewController) {
        
    }
}

