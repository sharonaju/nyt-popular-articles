//
//  ArticleRouterTest.swift
//  NYTPopularArticlesTests
//
//  Created by Sharon Varghese on 07/11/2022.
//

import XCTest
@testable import NYTPopularArticles

final class ArticleListRouterTest: XCTestCase {

    var sut: ArticleListRouter!
    var viewController: ArticleListViewControllerSpy!
    var spyNavigationController: NavigationControllerSpy!
    override func setUpWithError() throws {
        sut = ArticleListRouter()
        viewController = ArticleListViewControllerSpy()
//        sut.viewController = viewController
        spyNavigationController = NavigationControllerSpy(rootViewController: viewController)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

class NavigationControllerSpy: UINavigationController {
    var nextViewController: UIViewController?
    var pushViewControllerCalled = false
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.pushViewController(viewController, animated: animated)
        pushViewControllerCalled = true
        nextViewController = viewController
    
    }
    
    var presentCalled = false
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.present(viewControllerToPresent, animated: flag)
        presentCalled = true
        nextViewController = viewControllerToPresent
    }
    
    var showCalled = false
    override func show(_ vc: UIViewController, sender: Any?) {
        self.show(vc, sender: sender)
        showCalled = true
        nextViewController = vc
    }
    
    var dismissCalled = false
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismiss(animated: flag)
        dismissCalled = true
    }
    
//    var popToRootViewControllerCalled = false
//    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
//        self.popToRootViewController(animated: animated)
//        popToRootViewControllerCalled = true
//    }
    
}
