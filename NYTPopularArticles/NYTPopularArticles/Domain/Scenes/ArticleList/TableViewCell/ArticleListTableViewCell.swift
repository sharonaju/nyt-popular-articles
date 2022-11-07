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
        dateLabel.text = getDate(date: data?.updated ?? "")
        
    }
    
    func prepareCell() {
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.backgroundColor = UIColor.gray
    }
    
    func getDate(date: String) -> String{
        var dateStr = ""
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "EEE, dd MMM,yyyy"

        if let date = dateFormatterGet.date(from: date) {
            dateStr = dateFormatterPrint.string(from: date)
        }
        return dateStr
    }
}
