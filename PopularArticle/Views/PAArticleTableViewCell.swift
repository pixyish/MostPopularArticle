//
//  PAArticleTableViewCell.swift
//  PopularArticle
//
//  Created by Piyush on 20/11/20.
//  Copyright © 2020 Xebia Tech. All rights reserved.
//

import UIKit

class PAArticleTableViewCell: UITableViewCell {

    @IBOutlet weak private var imgView: UIImageView! {
        didSet {
            self.imgView.layer.cornerRadius = self.imgView.frame.size.width/2
        }
    }
    @IBOutlet weak private var titleLbl: UILabel!
    @IBOutlet weak private var descriptionLbl: UILabel!
    @IBOutlet weak private var sectionLbl: UILabel!
    @IBOutlet weak private var dateBtn: UIButton!
    var resultInfo:Results? {
        didSet {
            if let info = resultInfo {
                titleLbl.text       = info.title
                descriptionLbl.text = info.abstract
                sectionLbl.text     = info.section
                dateBtn.setTitle(info.published_date, for: UIControl.State.normal)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
