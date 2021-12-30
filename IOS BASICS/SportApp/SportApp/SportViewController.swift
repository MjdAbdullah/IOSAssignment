//
//  SportViewController.swift
//  SportApp
//
//  Created by admin on 29/12/2021.
//

import UIKit

class SportViewController: UIViewController {
    
    let context = ( UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var sportList = [SportEntity]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func bAddSport(_ sender: Any) {
        let alert = UIAlertController(title: "New Sport", message: "Enter new sport", preferredStyle: .alert)
        // to show text field to enter the text
        alert.addTextField(configurationHandler: nil)
        // Add button with Action
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
            return
        }
            // Take text and Creat it in the list
            self?.createSport(name: text)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        getAllSport()
    }
    
    func editSportAlert(sport: SportEntity){
        let alert = UIAlertController(title: sport.name! , message: "Edit \(sport.name!)", preferredStyle: .alert)
        // to show text field to enter the text
        alert.addTextField(configurationHandler: nil)
        // Add button with Action
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { [weak self] _ in guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
            return
        }
            // Take text and Creat it in the list
            self?.updateSport(sport: sport, newName: text)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    

    // CoreData
    func getAllSport(){
        do{
            sportList = try context.fetch(SportEntity.fetchRequest())
            tableView.reloadData()
        }catch{
            print("Can't get items")
        }
    }
    // add new sport
    func createSport(name: String){
        let newSport = SportEntity(context: context)
        newSport.name = name
        do{
            try context.save()
            // update the list in the table view
            getAllSport()
        }catch{
            print("Can't add new sport")
        }
    }
    // edit the sport
    func updateSport(sport: SportEntity, newName: String){
        sport.name = newName
        do{
            try context.save()
            // update the list in the table view
            getAllSport()
        }catch{
            print("Can't update")
        }
    }
    // delete sport
    func deleteSport(sport: SportEntity){
        context.delete(sport)
        do{
            try context.save()
            // update the list in the table view
            getAllSport()
        }catch{
            print("Can't delete")
        }
    }

}

extension SportViewController : UITableViewDelegate, UITableViewDataSource {
    // number of row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportList.count
    }
    // will enter in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportCell", for: indexPath) as! SportTableViewCell
        let name = sportList[indexPath.row].name!
        cell.setName(name: name)
        if sportList[indexPath.row].image != nil {
            let image = sportList[indexPath.row].image!
            cell.setImage(image: image)
        }
        return cell
    }
    
    // if the user swip from rigth -> trailing
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // to know wich one that will delete
        let sport = self.sportList[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.deleteSport(sport: sport)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    // if the user swip from left -> leading
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let sport = self.sportList[indexPath.row]
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
            self.editSportAlert(sport: sport)
            
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerCV = storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
        playerCV.sport = sportList[indexPath.row]
        self.navigationController?.pushViewController(playerCV, animated: true)
    }
    
}
