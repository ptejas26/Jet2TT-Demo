//
//  ViewController.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 Tejas Patelia. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //MARK: --- OUTLETS ---
    @IBOutlet weak var articleTableView : UITableView!
    @IBOutlet weak var countBarButton : UIBarButtonItem!

    //MARK: --- VARIABLES ---
    
    var homeViewModel = HomeViewModel()
    var pageSize = 1{
        didSet{
            homeViewModel.page = pageSize
        }
    }
    
    //MARK: --- VIEW DELEGATES ---
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.viewDidLoad()
        homeViewModel.reloadTableClosure = {
            self.articleTableView.reloadData()
        }
        setupUI()
    }
    
    //MARK: --- LOGICAL METHODS ---
    func setupUI() {
        articleTableView.estimatedRowHeight = 300
        articleTableView.rowHeight = UITableView.automaticDimension
    }
    
}

//MARK: --- TABLEVIEW DELEGATE AND DATASOURCE ---
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.countOfArticles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let articleCell = tableView.dequeueReusableCell(withIdentifier: Constant.TableViewCellIdentifier.ArticlesIdentifer) as? ArticlesTableViewCell else {return UITableViewCell()}
        let articleVM = homeViewModel.returnModelFor(indexpath: indexPath)
        articleCell.updateCellDetails(articleViewModel: articleVM)
        return articleCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //Since there is no total number of items so doing it without comparision of totalItems vs shownItems
        if indexPath.row == homeViewModel.countOfArticles - 1{
            pageSize = pageSize + 1
            homeViewModel.getArticles()
            homeViewModel.reloadTableClosure = {
                self.articleTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
