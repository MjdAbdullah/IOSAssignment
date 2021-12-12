//
//  TableViewCell.swift
//  AgingPeople
//
//  Created by admin on 12/12/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var lblMain: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    func setUpCell(name: String, age: Int){
        lblMain.text = name
        lblDetails.text = "\(age) years old"
    }
    
}
