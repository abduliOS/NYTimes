//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by Abdul on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import XCTest
@testable import NYTimes
@testable import WebKit
class NYTimesTests: XCTestCase {
    

    override func setUpWithError() throws {
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    func testViewDidLoadCallsPresenter() {
//        let sut = DetailsViewController()
//        
//        sut.viewDidLoad()
//        
//        XCTAssertTrue(sut.onView)
//    }
//
//    func testOnEditCallsPresenter() {
//        let sut = DetailsViewController()
//        
//        sut.onEdit(.init())
//        
//        XCTAssertTrue(presenter.onEditCalled)
//    }
//   
   func testGettingJSON() {
     let ex = expectation(description: "Expecting a JSON data not nil")
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    let url : NSString = String(format:"https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=%@" ,appDelegate.APIKEY) as NSString
    //let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""

     let fetchURL : NSURL = NSURL(string: url as String)!
     let request = URLRequest(url: fetchURL as URL)
    
     let viewController = ViewController()
    
    viewController.viewModelNYT.fetchNYTApiResults(request: request) { (error, result) in
       
       XCTAssertNotNil(result)
       ex.fulfill()

     }

     waitForExpectations(timeout: 10) { (error) in
       if let error = error {
         XCTAssertNil(error)
         XCTFail("error: \(error)")
       }
     }
   }

}
