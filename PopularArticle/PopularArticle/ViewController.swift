//
//  ViewController.swift
//  PopularArticle
//
//  Created by Piyush on 19/11/20.
//  Copyright © 2020 Xebia Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var results:[Results]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUI()
    }

    //MARK:- Private Methods
    func setUI() {
        self.callApi(path: PAConstant.getArticleURl(path: .path7))
    }
    
    func parseResponse(_ data: Data) -> JSONResult? {
        do {
            let decoder = JSONDecoder()
            let responseModel = try? decoder.decode(JSONResult.self, from: data)
            return responseModel
        } catch {
            print("Data parsing error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func callApi(path:String) {
        PANetwrokManager.sharedInstance.execute(requestMethod: .get, path: path, params: nil)  { [weak self] (apiStatus, response) in
            if apiStatus.isSuccess {
                if let jsonResult = self?.parseResponse(response as! Data) {
                    if let status = jsonResult.status,status.uppercased().contains("OK"), let dataResult = jsonResult.results {
                            self?.results = dataResult
                            print(self?.results?.count)
                     }
                   }
            } else {
                if let self = self {
                    self.showAlert(ttl: apiStatus.title, msg: apiStatus.msg)
                }
            }
        }
    }
}

