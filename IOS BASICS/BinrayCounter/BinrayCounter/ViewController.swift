//
//  ViewController.swift
//  BinrayCounter
//
//  Created by admin on 13/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,ChangeValue {
    
    func ChangeTotal(value: Int) {
        total += value
        lblTotale.text = "Total: \(total)"
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTotale: UILabel!
    var arrNumber = [Int]()
    var total = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let data = arrNumber[indexPath.row]
        cell.delegate = self
        cell.setUpNumber(num: data)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        for i in 0...16{
            arrNumber.append(Int(pow(10.0, Double(i))))
        }
        
        lblTotale.text = "Total: 0"
    }
}
