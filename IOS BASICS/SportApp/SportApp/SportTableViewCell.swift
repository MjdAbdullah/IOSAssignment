//
//  SportTableViewCell.swift
//  SportApp
//
//  Created by admin on 30/12/2021.
//

import UIKit
import Foundation

class SportTableViewCell: UITableViewCell {
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivSport: UIImageView!
    @IBAction func bAddImage(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        //imagePicker.present(imagePicker, animated: true)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagePicker.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    
    func setName(name: String){
        lblName.text = name
    }
    
    func setImage(image: Data){
    }

}

extension SportTableViewCell : UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        ivSport.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
