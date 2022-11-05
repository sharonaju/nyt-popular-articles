//
//  ArticleListPresenter.swift
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

protocol ArticleListPresentationLogic
{
  func presentArticleList(response: ArticleList.FetchArticleList.Response)
}

class ArticleListPresenter: ArticleListPresentationLogic
{
  weak var viewController: ArticleListDisplayLogic?
  
  // MARK: Present Article List
  
  func presentArticleList(response: ArticleList.FetchArticleList.Response)
    {
        let viewModel = ArticleList.FetchArticleList.ViewModel(articles: response.articles)
        viewController?.displayArticleList(viewModel: viewModel)
    }
}