//
//  PeopleTableViewController.swift
//  MVCinIOS
//
//  Created by admin on 23/12/2021.
//

import UIKit

class PeopleTableViewController: UITableViewController {

    var peopleList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for person in results {
                            let personDict = person as! NSDictionary
                            self.peopleList.append(personDict["name"]! as! String)
                            
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
        /*
        let url = URL(string:"https://swapi.dev/api/people/")
        let sesion = URLSession.shared
        let task = sesion.dataTask(with: url!, completionHandler: {
            data, respose, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary{
                    if let result = jsonResult["results"] as? NSArray {
                        for person in result {
                            let personDict = person as! NSDictionary
                            self.peopleList.append(personDict["name"]! as! String)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error)
            }
        })
        task.resume()
        */
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = peopleList[indexPath.row]
        tableView.delegate = self
        tableView.dataSource = self
        return cell
    }

}
