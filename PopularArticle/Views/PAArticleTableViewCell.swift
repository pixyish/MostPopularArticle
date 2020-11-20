//
//  PAArticleTableViewCell.swift
//  PopularArticle
//
//  Created by Piyush on 20/11/20.
//  Copyright © 2020 Xebia Tech. All rights reserved.
//

import UIKit

class PAArticleTableViewCell: UITableViewCell {

    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var titleLbl: UILabel!
    @IBOutlet weak private var descriptionLbl: UILabel!
    @IBOutlet weak private var dateLbl: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
