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
    
    static func addTask(objective: String, completion: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
        let url = URL(string: "https://saudibucketlistapi.herokuapp.com/tasks/?format=json")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let bodyData = "objective\(objective)"
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completion)
        task.resume()
        
    }
}
