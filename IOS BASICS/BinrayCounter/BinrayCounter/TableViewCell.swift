//
//  TableViewCell.swift
//  BinrayCounter
//
//  Created by admin on 13/12/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func bPlus(_ sender: UIButton) {
        
    }
    
    @IBAction func bMinus(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var lblNumber: UILabel!
    
    func setUpNumber(num: Int){
        lblNumber.text = "\(num)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
