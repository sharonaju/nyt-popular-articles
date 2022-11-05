//
//  ArticleDetailDateTableViewCell.swift
//  NYTPopularArticles
//
//  Created by Sharon Varghese on 05/11/2022.
//

import UIKit

class ArticleDetailDateTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ArticleDetailDateTableViewCellID"
    @IBOutlet var byLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    var dateString: String? {
        didSet {
            assignDate()
        }
    }
    var byText: String? {
        didSet {
            assignByLabel()
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
    func assignDate() {
        dateLabel.text = dateString ?? ""
    }
    func assignByLabel() {
        byLabel.text = byText ?? ""
    }
}
