//
//  ErrorResponse.swift
//  NYTPopularArticles
//
//  Created by Sharon Varghese on 04/11/2022.
//

import UIKit

class ErrorResponse: Codable {
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "error"
    }
}

