//
//  TableViewCell.swift
//  BinrayCounter
//
//  Created by admin on 13/12/2021.
//

import UIKit

protocol ChangeValue: class{
    func ChangeTotal(value: Int)
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: ChangeValue?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func bPlus(_ sender: UIButton) {
        let value = Int(lblNumber.text!)!
        delegate?.ChangeTotal(value: value)
    }
    
    @IBAction func bMinus(_ sender: UIButton) {
        var value = Int(lblNumber.text!)!
        value = -value
        delegate?.ChangeTotal(value: value)
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
