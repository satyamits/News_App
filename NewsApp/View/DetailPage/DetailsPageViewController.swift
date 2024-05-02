//
//  DetailsPage.swift
//  NewsApp
//
//  Created by Satyam Singh on 02/05/24.
//

import Foundation
import UIKit
import Kingfisher

class DetailsPageViewController: UIViewController {
    
    
    @IBOutlet weak var descriptionTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var imagePic: UIImageView!
    
    var newsItem: Article?
    
    @IBOutlet weak var contentTxt: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
    }
    
    func setData() {
        if let newsItem {
            self.titleTxt.text = self.newsItem?.title
            self.descriptionTxt.text = self.newsItem?.description
            self.contentTxt.text = self.newsItem?.content
            guard let urlStr = newsItem.urlToImage else {
                return
            }
            guard let url = URL(string: urlStr) else {
                return
            }
            self.imagePic.kf.setImage(with: url)
            
            // Set other data
            
        }
    }
}

