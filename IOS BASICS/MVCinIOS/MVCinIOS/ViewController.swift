//
//  ViewController.swift
//  MVCinIOS
//
//  Created by admin on 23/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tabelView: UITableView!
    @IBAction func bPeople(_ sender: UIButton) {
        arr = peopleList
        tabelView.reloadData()
    }
    @IBAction func bFilm(_ sender: UIButton) {
        arr = filmList
        arr.append("1")
        tabelView.reloadData()
    }
    var arr = [String]()
    var peopleList = [String]()
    var filmList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
                        } catch {
                            print("Something went wrong")
                        }
                })
        StarWarsModel.getAllFilm(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                    data, response, error in
                        do {
                            // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                if let results = jsonResult["results"] as? NSArray {
                                    for person in results {
                                        let personDict = person as! NSDictionary
                                        self.filmList.append(personDict["title"]! as! String)
                                    }
                                }
                            }
                        } catch {
                            print("Something went wrong")
                        }
                })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = peopleList[indexPath.row]
        return cell
    }

}

