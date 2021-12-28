//
//  TaskModel.swift
//  BucteList_Client
//
//  Created by admin on 27/12/2021.
//

import Foundation

class TaskModel {
    static func getAllTasks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "https://saudibucketlistapi.herokuapp.com/tasks/?format=json")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
    static func addTask(objective: String, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        let url = URL(string: "https://saudibucketlistapi.herokuapp.com/tasks/?format=api")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let bodyData = "objective\(objective)"
        request.httpBody = bodyData.data(using: .utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
    
    static func updateTask(task:NSDictionary, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        let url = URL(string: "https://saudibucketlistapi.herokuapp.com/tasks/?format=api")
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        do{
            let bodyData = try JSONSerialization.data(withJSONObject: task, options: .prettyPrinted)
            request.httpBody = bodyData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: completionHandler)
            task.resume()
        }catch{
            
        }
    }
}
