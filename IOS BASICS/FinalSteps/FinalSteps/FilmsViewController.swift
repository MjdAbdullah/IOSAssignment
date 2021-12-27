//
//  FilmsViewController.swift
//  FinalSteps
//
//  Created by admin on 25/12/2021.
//

import UIKit

class FilmsViewController: UIViewController {
    
    var passedFilm: NSDictionary!
    
    
    @IBOutlet weak var lblNmae: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRelease: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var tvOpenin: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblNmae.text = passedFilm["title"] as? String
        lblTitle.text = "Title: \(passedFilm["title"] ?? "nil")"
        tvOpenin.text = passedFilm["opening_crawl"] as? String
        lblRelease.text = "Release Date: \(passedFilm["release_date"] ?? "nil")"
        lblDirector.text = "Director: \(passedFilm["director"] ?? "nil")"
        
    }
    

    

}
