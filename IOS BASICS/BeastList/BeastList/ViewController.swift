//
//  ViewController.swift
//  BeastList
//
//  Created by Mjd on 11/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrNote = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrNote[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfNewNote: UITextField!
    @IBOutlet weak var bAdd: UIButton!
    @IBAction func bAdd(_ sender: Any) {
        if let newNote = tfNewNote.text {
            arrNote.append(newNote)
            let index = IndexPath(row: arrNote.count - 1 , section: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [index], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

}

