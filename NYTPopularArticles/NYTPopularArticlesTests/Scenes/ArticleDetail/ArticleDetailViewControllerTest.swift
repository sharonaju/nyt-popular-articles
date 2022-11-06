//
//  ArticleDetailViewControllerTest.swift
//  NYTPopularArticlesTests
//
//  Created by Sharon Varghese on 06/11/2022.
//

import XCTest
@testable import NYTPopularArticles

final class ArticleDetailViewControllerTest: XCTestCase {
    
    var sut: ArticleDetailViewController!
    var interactorSpy: ArticleDetailInteractorSpy!
    var article: Article?
    override func setUpWithError() throws {
        sut = ArticleDetailViewController()
        interactorSpy = ArticleDetailInteractorSpy()
        sut.interactor = interactorSpy
        article = getMockArticle()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewControllerID") as? ArticleDetailViewController
        sut.loadViewIfNeeded()
    }
    
    // MARK: Nil checks
    func testArticleList_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.tableView)
    }

    // MARK: DataSource
    func testDataSource_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView?.dataSource is ArticleDetailViewController)
    }
    
    // MARK: Delegate
    func testDelegate_SetsTableViewDelegate()  {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView?.delegate is ArticleDetailViewController)
    }
    func testShouldDisplaySelectedArticle() {
        
        // Given
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy
        let viewModel = ArticleDetail.ArticleItem.ViewModel(article: article)
        // When
        sut.displayArticle(viewModel: viewModel)
        // Then
        XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched articles should reload the table view")
    }
    
    func testShouldConfigureTableViewCellToDisplayOrder() {
        // Given
        let tableView = sut.tableView
        let viewModel = ArticleDetail.ArticleItem.ViewModel(article: article)
        sut.displayArticle(viewModel: viewModel)
        // When
        let indexPath0 = IndexPath(row: 0, section: 0)
        let cell0 = sut.tableView(tableView!, cellForRowAt: indexPath0)
         as! ArticleDetailTitleTableViewCell
        // Then
        XCTAssertEqual(cell0.titleLabel?.text, "Julie Powell, Food Writer Known for ‘Julie & Julia,’ Dies at 49")
        // When
        let indexPath1 = IndexPath(row: 1, section: 0)
        let cell1 = sut.tableView(tableView!, cellForRowAt: indexPath1)
         as! ArticleDetailImageTableViewCell
        // Then
        XCTAssertEqual(cell1.data, "https://static01.nyt.com/images/2022/11/01/dining/01powell-obit1/merlin_29215068_e3a6bb15-0501-415c-8920-b58412a3661e-mediumThreeByTwo440.jpg")
        // When
        let indexPath2 = IndexPath(row: 2, section: 0)
        let cell2 = sut.tableView(tableView!, cellForRowAt: indexPath2)
         as! ArticleDetailDateTableViewCell
        // Then
        XCTAssertEqual(cell2.dateString, "2022-11-03 14:41:34")
        XCTAssertEqual(cell2.byText, "By Kim Severson and Julia Moskin")
        // When
        let indexPath3 = IndexPath(row: 3, section: 0)
        let cell3 = sut.tableView(tableView!, cellForRowAt: indexPath3)
         as! ArticleDetailDescriptionTableViewCell
        // Then
        XCTAssertEqual(cell3.data, "She attempted to cook every recipe in a classic Julia Child cookbook and documented the effort in a popular blog that became a best-selling book and a hit movie.")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        interactorSpy = nil
    }
    func getMockArticle() -> Article? {
        guard let path = Bundle(for: ArticleNetworkModelTest.self).path(forResource: "MockArticleList", ofType: "json")
        else { fatalError("Can't find search.json file") }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let response = try JSONDecoder().decode(ArticleNetworkModel.self, from: data)
            let articles = response.results
            return articles?.first
        } catch {
            print(error)
        }
       
        return nil
    }

}

//MARK: Interactor Spy
class ArticleDetailInteractorSpy: ArticleDetailBusinessLogic, ArticleDetailDataStore {
    
    var article: Article?
    var showArticlesCalled = false
    func showSelectedArticle() {
        showArticlesCalled = true
    }
    
   
    
    
}
