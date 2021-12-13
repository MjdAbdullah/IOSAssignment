//
//  ViewController.swift
//  BinrayCounter
//
//  Created by admin on 13/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTotale: UILabel!
    var arrNumber = [Int]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let data = arrNumber[indexPath.row]
        cell.setUpNumber(num: data)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        arrNumber.append(Int(pow(10.0, 0.0)))
        arrNumber.append(Int(pow(10.0, 1.0)))
        arrNumber.append(Int(pow(10.0, 2.0)))
        arrNumber.append(Int(pow(10.0, 3.0)))
        arrNumber.append(Int(pow(10.0, 4.0)))
        arrNumber.append(Int(pow(10.0, 5.0)))
        arrNumber.append(Int(pow(10.0, 6.0)))
        arrNumber.append(Int(pow(10.0, 7.0)))
        arrNumber.append(Int(pow(10.0, 8.0)))
        arrNumber.append(Int(pow(10.0, 9.0)))
        arrNumber.append(Int(pow(10.0, 10.0)))
        arrNumber.append(Int(pow(10.0, 11.0)))
        arrNumber.append(Int(pow(10.0, 12.0)))
        arrNumber.append(Int(pow(10.0, 13.0)))
        arrNumber.append(Int(pow(10.0, 14.0)))
        arrNumber.append(Int(pow(10.0, 15.0)))
        arrNumber.append(Int(pow(10.0, 16.0)))
    }


}

