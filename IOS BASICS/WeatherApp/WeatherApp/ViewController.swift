//
//  ViewController.swift
//  WeatherApp
//
//  Created by admin on 21/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            let url = URL(string: "api.openweathermap.org/data/2.5/weather?q=jeddah&appid=6aef100c23f05d32f0544a56aa479a01")
            // create a URLSession to handle the request tasks
            let session = URLSession.shared
            // create a "data task" to make the request and run the completion handler
            // see: Swift closure expression syntax
            let task = session.dataTask(with: url!, completionHandler: { data, response, error in
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    print(jsonResult)
                    if let results = jsonResult["results"] {
                        // coercing the results object as an NSArray and then storing that in resultsArray
                        let resultsArray = results as! NSArray
                        // now we can run NSArray methods like count and firstObject
                        print(resultsArray.count)
                        print(resultsArray[0])
                        print(resultsArray.firstObject)
                    }
                }
            } catch {
                print(error)
            }
            })
            // execute the task and wait for the response before
            // running the completion handler. This is async!
            task.resume()
        }
    }

    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblHearest: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblWindspeed: UILabel!
    @IBOutlet weak var lblCloud: UILabel!
    @IBOutlet weak var lblPrecioitation: UILabel!
    @IBOutlet weak var lblFeels: UILabel!
    
    let url = "api.openweathermap.org/data/2.5/weather?q=jeddah&appid=6aef100c23f05d32f0544a56aa479a01"
    
    
}

