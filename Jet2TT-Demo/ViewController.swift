//
//  ViewController.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 GlobalLogic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var articleTableView : UITableView!
    
    
    var articleViewModelArray : [ArticleViewModel] = [ArticleViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.sharedInstance.getArticles { (articles) in
            if let articles = articles, articles.count > 0 {
                for article in articles {
                    self.articleViewModelArray = ArticleViewModel(article: article)
                }
            }
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

