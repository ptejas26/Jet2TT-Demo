//
//  Constant.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 GlobalLogic. All rights reserved.
//

import Foundation


struct Constant {
    struct API_URLS {
        static let get_articles : String = "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?"
    }
    struct UserDefaultKey{
        static let PINNED_USER_DETAILS = "location"
    }
    
    struct TableViewCellIdentifier {
        static let ArticlesIdentifer = "ArticlesTableViewCell"
    }
}
