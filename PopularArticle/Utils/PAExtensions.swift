//
//  PAExtensions.swift
//  PopularArticle
//
//  Created by Piyush on 20/11/20.
//  Copyright © 2020 Xebia Tech. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(ttl:String,msg:String) {
        let alert = UIAlertController(title: ttl, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
