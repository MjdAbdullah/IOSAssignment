//
//  ViewController.swift
//  RainbowRoad
//
//  Created by admin on 12/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrColor = [UIColor]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrColor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let data = arrColor[indexPath.row]
        cell.setUpColo(color: data)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        arrColor.append(UIColor.red)
        arrColor.append(UIColor.orange)
        arrColor.append(UIColor.yellow)
        arrColor.append(UIColor.green)
        arrColor.append(UIColor.blue)
        arrColor.append(UIColor.purple)
    }


}

