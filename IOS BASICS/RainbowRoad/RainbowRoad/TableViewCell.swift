//
//  TableViewCell.swift
//  RainbowRoad
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
    
    func setUpColo(color: UIColor){
       self.backgroundColor = color
    }

}
