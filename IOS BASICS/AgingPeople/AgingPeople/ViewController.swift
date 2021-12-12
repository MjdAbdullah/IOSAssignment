//
//  ViewController.swift
//  AgingPeople
//
//  Created by admin on 12/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrNames = [(String,Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        arrNames.append(("George", Int.random(in: 5..<96)))
        arrNames.append(("Betty", Int.random(in: 5..<96)))
        arrNames.append(("Fran", Int.random(in: 5..<96)))
        arrNames.append(("Joe", Int.random(in: 5..<96)))
        arrNames.append(("Helda", Int.random(in: 5..<96)))
        arrNames.append(("Winifred", Int.random(in: 5..<96)))
        arrNames.append(("Zed", Int.random(in: 5..<96)))
        arrNames.append(("Sara", Int.random(in: 5..<96)))
        arrNames.append(("Jeffy", Int.random(in: 5..<96)))
        arrNames.append(("Abraham", Int.random(in: 5..<96)))
        arrNames.append(("Anna", Int.random(in: 5..<96)))
        arrNames.append(("Melinda", Int.random(in: 5..<96)))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let data = arrNames[indexPath.row]
        cell.setUpCell(name: data.0, age: data.1)
        return cell
    }
    
    


}

