//
//  EndPointItemTest.swift
//  NYTPopularArticlesTests
//
//  Created by Sharon Varghese on 05/11/2022.
//

import XCTest
@testable import NYTPopularArticles


final class EndPointItemTest: XCTestCase {

    let sut = EndPointItem.viewed(1)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBaseURL() {
        let baseURL = sut.baseURL
        XCTAssertEqual(baseURL, "http://api.nytimes.com/svc/mostpopular/")
    }
    
    func testHeaders() {
        let headers = sut.headers
        XCTAssertEqual(headers?["Content-Type"], "application/json")
        XCTAssertEqual(headers?["X-Requested-With"], "XMLHttpRequest")
    }

    func testPath() {
        let path = sut.path
        XCTAssertEqual(path, "viewed/1.json")
    }
    
    func testHTTPMethod() {
        let httpMethod = sut.httpMethod
        XCTAssertEqual(httpMethod, .get)
    }
    
    func testVersion() {
        let version = sut.version
        XCTAssertEqual(version, "v2/")
    }
    
    func testURL() {
        let url = sut.url
        XCTAssertEqual(url, URL(string: "http://api.nytimes.com/svc/mostpopular/v2/viewed/1.json"))
    }
}
