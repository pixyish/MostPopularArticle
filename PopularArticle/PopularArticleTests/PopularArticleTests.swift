//
//  PopularArticleTests.swift
//  PopularArticleTests
//
//  Created by Piyush on 19/11/20.
//  Copyright © 2020 Xebia Tech. All rights reserved.
//

import XCTest
@testable import PopularArticle

class PopularArticleTests: XCTestCase {
    var controller:ViewController?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        controller = ViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        controller  = nil
    }
       
    func testParsingMethod()  {
        if let data = self.readLocalFile(forName: "local")  {
            if let result = Parser.parseJsonResult(response: data) {
                XCTAssertGreaterThan(result.count, 0)
            }
        } else {
            XCTAssertTrue(false)
        }
    }
    
    func testCacheImg() {
        let imgName = "calendar_icon"
        let imgView = UIImageView(image: UIImage(named: imgName))
        let _ = imgView.cacheImg(imgName: imgName)
        
        let imgFromCache = imgView.cacheImg(imgName: imgName)
        XCTAssertNotNil(imgFromCache)
        
    }
    
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
