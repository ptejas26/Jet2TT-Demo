//
//  ArticleViewModel.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 Tejas Patelia. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    
    
    
//    init(article : Article) {
//        self.article = article
//    }
    
    
    
    //    var articleViewModelArray : [ArticleViewModel] = [ArticleViewModel]() {
    //        didSet {
    //            countBarButton.title = "showing \(articleViewModelArray.count) articles"
    //        }
    //    }

    
    var article: Article?
    
    var fullName : String {
        return "\(article?.user?.first?.name ?? "FirstName") \(article?.user?.first?.lastname ?? "LastName")"
    }
    var userProfile: String {
        return "\(article?.user?.first?.avatar ?? "userplaceholder")"
    }
    var postedTime: String{
        return "\(article?.media?.first?.createdAt ?? "NA")"
    }
    
    var userDesignation: String {
        return "\(article?.user?.first?.designation ?? "NA")"
    }
    
    var showArticleImage : (Bool, String) {
        if let imgURL = article?.media?.first?.image {
            return (false,imgURL)
        } else {
            return (true, "")
        }
    }
    
    var articleText : String {
        return "\(article?.content ?? "NA")"
    }
    
    var articleTitle : String {
        return "\(article?.media?.first?.title ?? "NA")"
    }
    
    var articleURL : String {
        return "\(article?.media?.first?.url ?? "")"
    }
    
    var articleLikes : String {
        return "\(Utilities.returnHigherNumericValue(likes_comments: article?.likes ?? 0)) Likes"
    }
    
    var articleComments : String {
        return "\(Utilities.returnHigherNumericValue(likes_comments: article?.comments ?? 0)) Comments"
    }
    
    var articleTime: Date {
        return Utilities.convertFromISODate(strDate: article?.createdAt ?? "2020-04-14T10:44:00+0000") ?? Date()
    }
}
