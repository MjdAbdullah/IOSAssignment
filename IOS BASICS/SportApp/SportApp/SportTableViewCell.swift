//
//  SportTableViewCell.swift
//  SportApp
//
//  Created by admin on 30/12/2021.
//

import UIKit

class SportTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setName(name: String){
        lblName.text = name
    }

}
