//
//  ViewController.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 Tejas Patelia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var articleTableView : UITableView!
    @IBOutlet weak var countBarButton : UIBarButtonItem!

    var articleViewModelArray : [ArticleViewModel] = [ArticleViewModel]() {
        didSet {
            countBarButton.title = "showing \(articleViewModelArray.count) articles"
        }
    }
    var pageSize = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getArticles()
        setupUI()
    }
    
    func setupUI() {
        articleTableView.estimatedRowHeight = 300
        articleTableView.rowHeight = UITableView.automaticDimension
    }
    
    func getArticles(withPage page:Int = 1, andlimit limit:Int = Constant.APICallPageLimit.Limit) {
        APIManager.sharedInstance.getArticles(page: page, limit: limit) { (articles) in
            if articles.count > 0 {
                for article in articles {
                    self.articleViewModelArray.append(ArticleViewModel(article: article))
                }
                self.articleTableView.reloadData()
            }
        }
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let articleCell = tableView.dequeueReusableCell(withIdentifier: Constant.TableViewCellIdentifier.ArticlesIdentifer) as? ArticlesTableViewCell else {return UITableViewCell()}
        articleCell.updateCellDetails(articleViewModel: articleViewModelArray[indexPath.row])
        return articleCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //Since there is no total number of items so doing it without comparision
        if indexPath.row == articleViewModelArray.count - 1{
            pageSize = pageSize + 1
            getArticles(withPage: pageSize)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

