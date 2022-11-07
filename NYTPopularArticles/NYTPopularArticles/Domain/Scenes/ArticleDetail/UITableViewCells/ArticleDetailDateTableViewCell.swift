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

    func assignDate() {
        dateLabel.text = getDate(date: dateString ?? "")
    }
    func assignByLabel() {
        byLabel.text = byText ?? ""
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
