//
//  ArticleDetailInteractor.swift
//  NYTPopularArticles
//
//  Created by Sharon Varghese on 05/11/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ArticleDetailBusinessLogic
{
    func showSelectedArticle()
}

protocol ArticleDetailDataStore
{
    var article: Article? { get set }
}

class ArticleDetailInteractor: ArticleDetailBusinessLogic, ArticleDetailDataStore
{
    var presenter: ArticleDetailPresentationLogic?
    var worker: ArticleDetailWorker?
    var article: Article?
    
    // MARK: Show Selected Article
    func showSelectedArticle() {
        let response = ArticleDetail.ArticleItem.Response(article: self.article)
        presenter?.presentSelectedArticel(response: response)
    }
}
