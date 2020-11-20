//
//  PAConstant.swift
//  PopularArticle
//
//  Created by Piyush on 19/11/20.
//  Copyright © 2020 Xebia Tech. All rights reserved.
//

import UIKit

enum paths:String {
    case path1 = "1"
    case path7 = "7"
    case path30 = "30"
}
class PAConstant: NSObject {
    static let apiKey = "IEzpm2iEvzGXANq3nuWQYCcAU6sSGLVP"
    static let ArticleListTitle = "NY Times Most Popular"
    static let internetOfflineMsg = "The Internet connection appears to be offline"
    static let cacheImg = true
    static let barColor = UIColor(red: 119/255.0, green: 215/255.0, blue: 187/255.0, alpha: 1.0)
    static func getArticleURl(path:paths = paths.path7) -> String {
        let imgUrlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(path.rawValue).json?api-key=\(self.apiKey)"
        return imgUrlString
    }
    
}

class Parser:NSObject {
    
    class func parseResponse(_ data: Data) -> JSONResult? {
          do {
              let decoder = JSONDecoder()
              let responseModel = try? decoder.decode(JSONResult.self, from: data)
              return responseModel
          }
    }
    class func parseJsonResult(response:Data) -> [Results]? {
        if let jsonResult = self.parseResponse(response) {
            if let status = jsonResult.status,status.uppercased().contains("OK"), let dataResult = jsonResult.results {
                   return dataResult
            }
        }
        return nil
    }

}
