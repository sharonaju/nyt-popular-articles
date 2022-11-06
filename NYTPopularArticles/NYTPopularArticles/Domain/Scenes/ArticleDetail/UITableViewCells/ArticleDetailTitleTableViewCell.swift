//
//  ArticleDetailTitleTableViewCell.swift
//  NYTPopularArticles
//
//  Created by Sharon Varghese on 05/11/2022.
//

import UIKit

class ArticleDetailTitleTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ArticleDetailTitleTableViewCellID"
    @IBOutlet var titleLabel: UILabel!
    var data: String? {
        didSet {
            loadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadData() {
        titleLabel.text = data ?? ""
    }
}
