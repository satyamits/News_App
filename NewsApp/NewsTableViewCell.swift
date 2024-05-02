//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Satyam Singh on 02/05/24.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionTxt: UILabel!
    @IBOutlet weak var titletxt: UILabel!
    @IBOutlet weak var imagePic: UIImageView!
    
    var imageUrlStr: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imagePic.image = nil
        
    }
    
    func config() {
        
        self.imagePic.image = nil
        DispatchQueue.global(qos: .background).async { [self] in
            if let imageUrlStr = self.imageUrlStr,
            let url = URL(string: imageUrlStr) {
                self.imagePic.kf.setImage(with: url, placeholder: UIImage(systemName: "bookmark.square.fill"))
                self.imagePic.layer.borderWidth = 1
                self.imagePic.layer.masksToBounds = false
                self.imagePic.layer.cornerRadius = imagePic.frame.height/2
                self.imagePic.clipsToBounds = true
                
            }
            else {
                print("Failed to load image")
            }
        }
        
    }
    
   
    
}
