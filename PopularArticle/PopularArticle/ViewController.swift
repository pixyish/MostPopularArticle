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
    @IBOutlet weak private var tblView:UITableView!
    @IBOutlet weak private var loadingView:UIView! {
        didSet {
            loadingView.layer.cornerRadius = 5
        }
    }
    private var reuseIdentifier = "articleCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUI()
    }

    //MARK:- Private Methods
    func setUI() {
        self.tblView.tableFooterView = UIView()
        navigationController?.navigationBar.barTintColor = PAConstant.barColor
        self.title = PAConstant.ArticleListTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.registerXib()
        self.callApi(path: PAConstant.getArticleURl(path: .path1))
        
    }
    
    func registerXib() {
        let cellNib = UINib(nibName: "PAArticleTableViewCell", bundle: nil)
        self.tblView.register(cellNib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func parseResponse(_ data: Data) -> JSONResult? {
        do {
            let decoder = JSONDecoder()
            let responseModel = try? decoder.decode(JSONResult.self, from: data)
            return responseModel
        }
    }
    
    func callApi(path:String) {
        PANetwrokManager.sharedInstance.execute(requestMethod: .get, path: path, params: nil)  { [weak self] (apiStatus, response) in
            UIView.animate(withDuration: 0.3) {
                self?.loadingView.alpha = 0
            }
            if apiStatus.isSuccess {
                if let jsonResult = self?.parseResponse(response as! Data) {
                    if let status = jsonResult.status,status.uppercased().contains("OK"), let dataResult = jsonResult.results {
                            self?.results = dataResult
                            self?.tblView.reloadData()
                            print(self?.results?.count ?? 0)
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

extension ViewController:UITableViewDataSource,UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let articleCell = tblView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? PAArticleTableViewCell {
            articleCell.resultInfo = self.results?[indexPath.row]
            return articleCell
        }
        let cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
        
}

