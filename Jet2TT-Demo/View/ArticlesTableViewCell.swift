//
//  ArticlesTableViewCell.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 GlobalLogic. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    
    //*********
    @IBOutlet weak var imgViewProfile : UIImageView!
    @IBOutlet weak var lblUserName : UILabel!
    @IBOutlet weak var lblDesignation : UILabel!
    @IBOutlet weak var lblArticlePostedTime : UILabel!
    //*********
    @IBOutlet weak var imgViewArticle : UIImageView!
    @IBOutlet weak var lblArticleText : UILabel!
    @IBOutlet weak var lblArticleTitle : UILabel!
    @IBOutlet weak var lblArticleURL : UILabel!
    //*********
    @IBOutlet weak var lblArticleLikes : UILabel!
    @IBOutlet weak var lblArticleComments : UILabel!
    //*********

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
