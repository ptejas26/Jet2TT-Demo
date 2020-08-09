//
//  ArticlesTableViewCell.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 Tejas Patelia. All rights reserved.
//

import UIKit
import Kingfisher

class ArticlesTableViewCell: UITableViewCell {
    
    //*********
    @IBOutlet weak var imgViewProfile : UIImageView!
    @IBOutlet weak var lblUserName : UILabel!
    @IBOutlet weak var lblDesignation : UILabel!
    @IBOutlet weak var lblArticlePostedTime : UILabel!
    //*********
    @IBOutlet weak var imgViewArticle : UIImageView!
    @IBOutlet weak var imgViewArticleHeightConstraint : NSLayoutConstraint!

    @IBOutlet weak var lblArticleText : UILabel!
    @IBOutlet weak var lblArticleTitle : UILabel!
    @IBOutlet weak var lblArticleURL : UILabel!
    //*********
    @IBOutlet weak var lblArticleLikes : UILabel!
    @IBOutlet weak var lblArticleComments : UILabel!
    //*********

    override func awakeFromNib() {
        super.awakeFromNib()
        imgViewProfile.layer.cornerRadius = imgViewProfile.bounds.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCellDetails(articleViewModel: ArticleViewModel) {
        
        lblUserName.text = articleViewModel.fullName
        lblDesignation.text = articleViewModel.userDesignation
        lblArticlePostedTime.text = articleViewModel.postedTime

        imgViewArticle.isHidden = articleViewModel.showArticleImage.0
        
        //This is the case when the article image is not avaiable so hiding the imgView
        imgViewArticle.downloadImage(urlString: articleViewModel.showArticleImage.1) { (status) in
            if status == false {
                self.imgViewArticleHeightConstraint.constant = 0
            }else{
                self.imgViewArticleHeightConstraint.constant = 150
            }
        }
        imgViewProfile.downloadImage(profile: true, urlString: articleViewModel.userProfile, completionHandler: nil)
        
        lblArticleText.text = articleViewModel.articleText
        lblArticleURL.text = articleViewModel.articleURL
        lblArticleTitle.text = articleViewModel.articleTitle

        lblArticleLikes.text = articleViewModel.articleLikes
        lblArticleComments.text = articleViewModel.articleComments
            
        lblArticlePostedTime.text = Utilities.calculateDateDifference(toDate: Date(), fromDate: articleViewModel.articleTime)
        
    }
    
    override func prepareForReuse() {
        imgViewProfile.image = nil
    }
}



