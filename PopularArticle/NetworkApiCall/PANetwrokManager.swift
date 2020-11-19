//
//  PANetwrokManager.swift
//  PopularArticle
//
//  Created by Piyush on 19/11/20.
//  Copyright © 2020 Xebia Tech. All rights reserved.
//

import UIKit

enum ApiStatus:String {
    case success = ""
    case failed  = "Api failed"
    case invalidURL = "invalid Url"
    case noInternet = "The Internet connection appears to be offline"
    
    static func statusCode(code:Int) -> ApiStatus {
        switch code {
        case 200:
            return ApiStatus.success
        case 400:
            return ApiStatus.invalidURL
        case 1019:
            return ApiStatus.noInternet
        default:
            return ApiStatus.failed
        }
    }
    var isSuccess:Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
    var title:String {
        return self.rawValue
    }
    var msg:String {
        switch self {
        case .noInternet:
            return PAConstant.internetOfflineMsg
        default:
            return ""
        }
    }
}
class PANetwrokManager: NSObject {

}
