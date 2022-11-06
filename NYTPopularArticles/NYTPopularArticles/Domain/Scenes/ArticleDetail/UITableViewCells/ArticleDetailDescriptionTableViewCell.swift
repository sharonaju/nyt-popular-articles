//
//  ArticleDetailDescriptionTableViewCell.swift
//  NYTPopularArticles
//
//  Created by Sharon Varghese on 05/11/2022.
//

import UIKit

class ArticleDetailDescriptionTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ArticleDetailDescriptionTableViewCellID"
    @IBOutlet var descriptionLabel: UILabel!
    var data: String? {
        didSet {
            assignDescription()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func assignDescription() {
        descriptionLabel.text = data ?? ""
    }
    
}
