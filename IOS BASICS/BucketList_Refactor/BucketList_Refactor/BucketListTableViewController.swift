//
//  BucketListTableViewController.swift
//  BucketList_Refactor
//
//  Created by admin on 19/12/2021.
//

import UIKit

class BucketListTableViewController: UITableViewController, AddItemDelegate {
    
    var arr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    // For any time clic in the cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    // dufelt
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        arr.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ((sender as? [UIBarButtonItem]) != nil) {
            let nC = segue.destination as! UINavigationController
            let addItenVC = nC.topViewController as! AddItemTableViewController
            addItenVC.delegate = self
        }else if ((sender as? [NSIndexPath]) != nil) {
            let nC = segue.destination as! UINavigationController
            let addItenVC = nC.topViewController as! AddItemTableViewController
            addItenVC.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = arr[indexPath.row]
            addItenVC.itemEdit = item
            addItenVC.indexPath = indexPath
        }
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        if let ip = indexPath {
            arr[ip.row] = text
        }else{
            arr.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }

    
}
