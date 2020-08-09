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
    
    var articleViewModelArray : [ArticleViewModel] = [ArticleViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getArticles()
        setupUI()
    }
    func getArticles() {
        APIManager.sharedInstance.getArticles { (articles) in
            if articles.count > 0 {
                for article in articles {
                    self.articleViewModelArray.append(ArticleViewModel(article: article))
                }
                self.articleTableView.reloadData()
            }
        }
    }
    func setupUI() {
        articleTableView.estimatedRowHeight = 300
        articleTableView.rowHeight = UITableView.automaticDimension
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
}

