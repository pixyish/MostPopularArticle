//
//  PAURLRequest.swift
//  PopularArticle
//
//  Created by Piyush on 19/11/20.
//  Copyright © 2020 Xebia Tech. All rights reserved.
//

import UIKit

enum RequestMethod:String {
    case get  = "GET"
    case post = "POST"
    case put  = "PUT"
}
class PAURLRequest: NSMutableURLRequest {
    
    convenience init?(reqestMethod:RequestMethod, urlString:String,params:[String:Any]? = nil) {
        guard let url = URL.init(string: urlString) else {
            return nil
        }
        self.init(url:url)
        do {
            if let param = params {
                let data = try JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
                self.httpBody = data
           }
        } catch {
            print("data parsing error");
        }
        self.httpMethod = reqestMethod.rawValue
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
