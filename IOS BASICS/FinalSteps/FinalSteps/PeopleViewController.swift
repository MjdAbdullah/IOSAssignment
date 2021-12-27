//
//  PeopleViewController.swift
//  FinalSteps
//
//  Created by admin on 25/12/2021.
//

import UIKit

class PeopleViewController: UIViewController {
    
    var person: NSDictionary!

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSpecies: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblBirth: UILabel!
    @IBOutlet weak var lblMass: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        lblName.text = person["name"] as? String
        lblMass.text = "Mass: \(person["mass"] ?? "nil")"
        //lblSpecies.text = "Species: \(person["specoes"] ?? "nil")"
        lblBirth.text = "Birth year \(person["birth_year"] ?? "nil")"
        lblGender.text = "Gender: \(person["gender"] ?? "nil")"
        
        let speciesURL = person["species"] as! NSArray
        if speciesURL.count > 0 {
            StarWarsModel.getSpeciec(url: speciesURL[0] as! String , completionHandler: {
                data, resppnse, error in
                do{
                    if let jsonResult = try JSONSerialization.jsonObject(with: data! , options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        DispatchQueue.main.async {
                            self.lblSpecies.text = "Species: \(jsonResult["name"] ?? "nil")"
                        }
                    }
                }catch{
                    print("ERROR")
                }
            })
        }else{
            lblSpecies.text = "Species: nil"
        }
        
        
    }
}
