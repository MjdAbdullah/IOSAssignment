//
//  ViewController.swift
//  ToDoListCoreData_Test
//
//  Created by admin on 21/12/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let context = ( UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var taskList = [TaskEntity]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func bAdd(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "new item", message: "Enter new item", preferredStyle: .alert)
        // to show text field to enter the text
        alert.addTextField(configurationHandler: nil)
        // Add button with Action
        alert.addAction(UIAlertAction(title: "ADD", style: .default, handler: { [weak self] _ in guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
            return
        }
            // Take text and Creat it in the list
            self?.createItem(name: text)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Simple to do list"
        tableView.delegate = self
        tableView.dataSource = self
        // load the list
        getAllItem()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectitem = taskList[indexPath.row]
        // This sheet to use can chooce if want delete or edit the item .
        let sheet = UIAlertController(title: "\((selectitem.name) as! String)", message: "What do you want?", preferredStyle: .alert)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: {_ in
            // for edit the item
            let alert = UIAlertController(title: "Edit item", message: "Edit the item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            // to show the item text for user
            alert.textFields?.first?.text = selectitem.name
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in guard let field = alert.textFields?.first, let newText = field.text, !newText.isEmpty else {
                return
            }
                // update the task name
                self?.updateItem(item: selectitem, newName: newText)
            }))
            self.present(alert, animated: true)
        }))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {_ in
            // Delete the task
            self.deleteItem(item: selectitem)
        }))
        present(sheet, animated: true)
        
    }
    // -----------------------------------------------------------------
    // core data
    // this to get the task list
    func getAllItem(){
        do{
            taskList = try context.fetch(TaskEntity.fetchRequest())
            tableView.reloadData()
        }catch{
            print("Can't get items")
        }
    }
    // add ne task
    func createItem(name: String){
        let newItem = TaskEntity(context: context)
        newItem.name = name
        do{
            try context.save()
            // update the list in the table view
            getAllItem()
        }catch{
            print("Can't add new Item")
        }
    }
    // update the item -> take the select task with new name
    func updateItem(item: TaskEntity, newName: String){
        item.name = newName
        do{
            try context.save()
            // update the list in the table view
            getAllItem()
        }catch{
            print("Can't update")
        }
    }
    // delete the item
    func deleteItem(item: TaskEntity){
        context.delete(item)
        do{
            try context.save()
            // update the list in the table view
            getAllItem()
        }catch{
            print("Can't delete")
        }
    }

}

