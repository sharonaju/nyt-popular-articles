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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func assignDescription() {
        descriptionLabel.text = data ?? ""
    }
    
}
