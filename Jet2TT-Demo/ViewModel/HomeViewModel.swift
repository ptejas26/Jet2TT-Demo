//
//  HomeViewModel.swift
//  Jet2TT-Demo
//
//  Created by Tejas Patelia on 10/01/21.
//  Copyright © 2021 Tejas. All rights reserved.
//
import Foundation

class HomeViewModel {
    
    private var articleViewModelArray: [ArticleViewModel] = [ArticleViewModel](){
        didSet{
            countOfArticles = articleViewModelArray.count
        }
    }
    var countOfArticles: Int = 0
    var reloadTableClosure : () -> () = {}
    private var _page : Int?
    
    var page : Int {
        get{return _page ?? 0}
        set{ _page = newValue}
    }
    private var limit : Int {
        return 10
    }
    
    func viewDidLoad() {
        getArticles()
    }
    
    func getArticles(withPage page:Int = 1, andlimit limit:Int = Constant.APICallPageLimit.Limit) {
        APIManager.sharedInstance.getArticles(page: page, limit: limit) { (articles) in
            if articles.count > 0 {
                for article in articles {
                    self.articleViewModelArray.append(ArticleViewModel(article: article))
                }
                self.reloadTableClosure()
            }
        }
    }
    func returnModelFor(indexpath:IndexPath) -> ArticleViewModel? {
        if articleViewModelArray.count > 0 {
            return self.articleViewModelArray[indexpath.row]
        }
        return nil
    }
}
