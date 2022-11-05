//
//  API.swift
//  NYTPopularArticles
//
//  Created by Sharon Varghese on 05/11/2022.
//

import Foundation
let nytAPIKey = "KhaXclSOAA4jYArv40DTWl0QOGXBWa3R"
class API: NSObject {
    static let shared = API()
    //This prevents others from using the default '()' initializer for this class.
    private override init() {
        
    }
    func fetchArticles(numberOfDays: Int, completion: @escaping (Result<[Article]?, ErrorInfo>)->()) {
        let params = ["api-key" : nytAPIKey]
        APIManager.shared().call(type: EndPointItem.viewed(numberOfDays), params: params) { (result: Swift.Result<ArticleNetworkModel, ErrorInfo>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
