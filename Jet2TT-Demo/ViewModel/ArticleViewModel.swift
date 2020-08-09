//
//  ArticleViewModel.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 GlobalLogic. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    
    init(article : Article) {
        self.article = article
    }
    
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
    
    var articleImage: String {
        return "\(article?.media?.first?.image ?? "articleplaceholder")"
    }
    
}
