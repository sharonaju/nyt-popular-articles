//
//  ArticleDetailImageTableViewCell.swift
//  NYTPopularArticles
//
//  Created by Sharon Varghese on 05/11/2022.
//

import UIKit

class ArticleDetailImageTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ArticleDetailImageTableViewCellID"
    @IBOutlet var articleImageView: UIImageView!
    var data: String? {
        didSet {
            loadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        prepareImageView()
    }

    func prepareImageView() {
        articleImageView.layer.cornerRadius = 5
    }
    
    func loadData() {
        if let imageURL = URL(string: data ?? "") {
            articleImageView.sd_setImage(with: imageURL)
        }
    }
    
}
