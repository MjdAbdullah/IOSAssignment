//
//  StarWarsMode.swift
//  FinalSteps
//
//  Created by admin on 25/12/2021.
//

import Foundation

class StarWarsModel {
    
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let url = URL(string: "https://swapi.dev/api/people/?format=json")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        
        task.resume()
    }
    
    static func getAllFilm(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        let url = URL(string: "https://swapi.dev/api/films")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        
        task.resume()
    }
    
    static func getSpeciec(url: String, completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        let url = URL(string: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        
        task.resume()
    }
}
