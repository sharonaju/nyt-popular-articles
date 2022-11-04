//
//  APITest.swift
//  NYTPopularArticlesTests
//
//  Created by Sharon Varghese on 05/11/2022.
//

import XCTest
@testable import NYTPopularArticles

final class APITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testAPIInit() {
        let apiManager = API.shared
        XCTAssertNotNil(apiManager)
    }
    func testFetchArticlesSuccess() {
        var response: ArticleResponse?
        var errorInfo: ErrorInfo?
        let expectation = self.expectation(description: "API fetched")
        API.shared.fetchArticles(numberOfDays: 1) { result in
            switch result {
            case .success(let data):
                response = data
                expectation.fulfill()
            case .failure(let error):
                errorInfo = error
                expectation.fulfill()
                
            }
        }
        wait(for: [expectation], timeout: 60)
        XCTAssertNotNil(response)
        XCTAssertNil(errorInfo)
    }

    func testFetchArticlesFailure() {
        var response: ArticleResponse?
        var errorInfo: ErrorInfo?
        let expectation = self.expectation(description: "API fetched")
        API.shared.fetchArticles(numberOfDays: -1) { result in
            switch result {
            case .success(let data):
                response = data
                expectation.fulfill()
            case .failure(let error):
                errorInfo = error
                expectation.fulfill()
                
            }
        }
        wait(for: [expectation], timeout: 60)
        XCTAssertNil(response)
        XCTAssertNotNil(errorInfo)
    }

}
