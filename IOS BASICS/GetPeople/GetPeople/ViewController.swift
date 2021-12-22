//
//  ViewController.swift
//  GetPeople
//
//  Created by admin on 22/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func bGet(_ sender: Any) {
        tableView.reloadData()
    }
    var peopleList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        let url = "https://swapi.dev/api/people/?format=json"
        getData(from: url)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = peopleList[indexPath.row]
        return cell
    }
    
    func getData(from url: String){
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, respones, error in
                
                guard let data = data, error == nil else{
                    print("ERROR")
                    return
                }
                // have the data
                var result: Response?
                do{
                    result =  try JSONDecoder().decode(Response.self, from: data)
                }catch{
                    print("failed to \(error.localizedDescription)")
                }
                
                guard let json = result else{
                    return
                }
                print(json.count)
                for i in json.results {
                    self.peopleList.append(i.name)
                    print(i.name)
                }
            }).resume()
        }
    }
    
    // -------------------------------------------------------------------------
    struct Response: Codable {
        let count: Int
        let next: String
        let previous: String?
        let results: [Result]
    }
    
    struct Result: Codable {
        let name, height, mass, hairColor: String
        let skinColor, eyeColor, birthYear: String
        let gender: String
        let homeworld: String
        let films, species, vehicles, starships: [String]
        let created, edited: String
        let url: String

        enum CodingKeys: String, CodingKey {
            case name, height, mass
            case hairColor = "hair_color"
            case skinColor = "skin_color"
            case eyeColor = "eye_color"
            case birthYear = "birth_year"
            case gender, homeworld, films, species, vehicles, starships, created, edited, url
        }
    }


}

