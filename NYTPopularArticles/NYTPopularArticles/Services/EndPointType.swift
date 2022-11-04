//
//  EndPointType.swift
//  NYTPopularArticles
//
//  Created by Sharon Varghese on 04/11/2022.
//
import Foundation
import Alamofire

protocol EndPointType {
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var version: String { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    
}
