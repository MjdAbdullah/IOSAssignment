//
//  FilmsTableViewController.swift
//  FinalSteps
//
//  Created by admin on 25/12/2021.
//

import UIKit

class FilmsTableViewController: UITableViewController {
    
    var filmList = [NSDictionary]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllFilm(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for film in results {
                            let filmDict = film as! NSDictionary
                            self.filmList.append(filmDict)
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
        let url = URL(string:"https://swapi.dev/api/films/")
        let sesion = URLSession.shared
        let task = sesion.dataTask(with: url!, completionHandler: {
            data, respose, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary{
                    if let result = jsonResult["results"] as? NSArray {
                        for person in result {
                            let personDict = person as! NSDictionary
                            self.filmList.append(personDict["title"]! as! String)
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
        return filmList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = filmList[indexPath.row]["title"] as? String
        tableView.delegate = self
        tableView.dataSource = self
        return cell
    }
    
    // for select cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = filmList[indexPath.row]
        performSegue(withIdentifier: "ShowDetails", sender: film)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let film = sender as? NSDictionary
        let fVC = segue.destination as? FilmsViewController
        fVC?.passedFilm = film
    }
}

