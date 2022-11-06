//
//  ArticleListTableViewCell.swift
//  NYTPopularArticles
//
//  Created by Sharon Varghese on 05/11/2022.
//

import UIKit
import SDWebImage

class ArticleListTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    //MARK: Properties
    static let reuseIdentifier = "ArticleListTableViewCellID"
    var data: Article? {
        didSet {
            loadData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        prepareCell()
    }

    func loadData()  {
        titleLabel.text = data?.title
        let mediaMetaData = data?.media?.first?.mediaMetadata?.filter{ $0.format == .standardThumbnail }
        if let imageURL = URL(string: mediaMetaData?.first?.url ?? "") {
            thumbnailImageView.sd_setImage(with: imageURL)
        }
        descriptionLabel.text = data?.abstract ?? ""
        dateLabel.text = data?.updated ?? ""
        
    }
    
    func prepareCell() {
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.backgroundColor = UIColor.gray
    }
}
