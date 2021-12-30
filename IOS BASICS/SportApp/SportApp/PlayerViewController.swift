//
//  PlayerViewController.swift
//  SportApp
//
//  Created by admin on 30/12/2021.
//

import UIKit

class PlayerViewController: UIViewController {
    
    let context = ( UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var tableView: UITableView!
    var sport: SportEntity!
    
    @IBOutlet weak var bAddPlayer: UIBarButtonItem!
    @IBAction func bAddPlayer(_ sender: Any) {
        let alert = UIAlertController(title: "New Player", message: "Enter new Player", preferredStyle: .alert)
        // to show text field to enter the text
        alert.addTextField { field in
            field.placeholder = "player name"
            field.returnKeyType = .next
        }
        alert.addTextField { field in
            field.placeholder = "player age"
            field.keyboardType = .numberPad
            field.returnKeyType = .next
        }
        alert.addTextField { field in
            field.placeholder = "player hight"
        }
        // Add button with Action
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
            guard let fields = alert.textFields, fields.count == 3 else {
            return
        }
            let nameField = fields[0]
            let ageField = fields[1]
            let hightField = fields[2]
            guard let name = nameField.text, !name.isEmpty,
                  let age = ageField.text, !age.isEmpty,
                  let hight = hightField.text, !hight.isEmpty else {
                      return
                  }
            // Take text and Creat it in the list
            self?.addPlayer(name: name, age: age, hight: hight)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        title = sport.name
    }
}

// CoreData
extension PlayerViewController {
    
    func addPlayer(name: String, age: String, hight: String){
        let newPlayer = PlayerEntity(context: context)
        newPlayer.name = name
        newPlayer.hight = hight
        newPlayer.age = age
        sport.addToPlayers(newPlayer)
        do{
            try context.save()
            // update the list in the table view
            tableView.reloadData()
        }catch{
            print("Can't add new player")
        }
    }
    
}
// table view
extension PlayerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let players = sport.players {
            return players.count
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell
        if let playerList = sport?.players?.allObjects as? [PlayerEntity]{
            let playerObj = playerList[indexPath.row]
            let name = playerObj.name!
            let age = playerObj.age!
            let hight = playerObj.hight!
            cell.setPlayer(name: name, age: age, hight: hight)
        }
        return cell
    }
}

