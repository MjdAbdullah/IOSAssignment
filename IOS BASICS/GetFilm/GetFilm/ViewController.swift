//
//  ViewController.swift
//  GetFilm
//
//  Created by admin on 22/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func bPeople(_ sender: UIButton) {
        arr = peopleList
        tableView.reloadData()
    }
    @IBAction func bFilms(_ sender: UIButton) {
        arr = filmList
        tableView.reloadData()
    }
    
    var arr = [String]()
    var peopleList = [String]()
    var filmList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        // Click in (Film) or (People) to get data
        arr.append("Click in (Film) or (People)")
        
        let urlPeople = "https://swapi.dev/api/people/?format=json"
        let urlFilm = "https://swapi.dev/api/films/?format=json"
        
        getDataFilm(from: urlFilm)
        getDataPeople(from: urlPeople)
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    func getDataFilm(from url: String){
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, respones, error in
                
                guard let data = data, error == nil else{
                    print("ERROR")
                    return
                }
                // have the data
                var result: ResponseFilm?
                do{
                    result =  try JSONDecoder().decode(ResponseFilm.self, from: data)
                }catch{
                    print("failed to \(error.localizedDescription)")
                }
                
                guard let json = result else{
                    return
                }
                print(json.count)
                for i in json.results {
                    self.filmList.append(i.title)
                    print(i.title)
                }
            }).resume()
        }
    }
    
    func getDataPeople(from url: String){
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, respones, error in
                
                guard let data = data, error == nil else{
                    print("ERROR")
                    return
                }
                // have the data
                var result: ResponsePeople?
                do{
                    result =  try JSONDecoder().decode(ResponsePeople.self, from: data)
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
    
    struct ResponseFilm: Codable {
        let count: Int
        let next, previous: String?
        let results: [ResultFilm]
    }

    struct ResultFilm: Codable {
        let title: String
        let episodeID: Int
        let openingCrawl, director, producer, releaseDate: String
        let characters, planets, starships, vehicles: [String]
        let species: [String]
        let created, edited: String
        let url: String

        enum CodingKeys: String, CodingKey {
            case title
            case episodeID = "episode_id"
            case openingCrawl = "opening_crawl"
            case director, producer
            case releaseDate = "release_date"
            case characters, planets, starships, vehicles, species, created, edited, url
        }
    }
    
    struct ResponsePeople: Codable {
        let count: Int
        let next: String?
        let previous: String?
        let results: [ResultPeople]
    }
    
    struct ResultPeople: Codable {
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

