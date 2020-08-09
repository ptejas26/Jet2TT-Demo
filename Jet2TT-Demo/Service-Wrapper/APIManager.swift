//
//  APIManager.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 Tejas Patelia. All rights reserved.
//

import Foundation
import Alamofire

class APIManager : NSObject {
    static let sharedInstance = APIManager()
    private override init() {}
    
    
    public func getArticles(page : Int = 1, limit: Int = 10, completionHandler: @escaping (([Article])->())){
        
        AF.request(Constant.API_URLS.get_articles + "page=\(page)&limit=\(limit)").response { response in
            debugPrint(response)
            
            if let res = response.response, res.statusCode == ResponseStatusCode.success.rawValue {
                
                
                if let body = response.data {
                    let json = self.parseResponse(data: body)
                    print(json)
                    completionHandler(json)
                }
            }
        }
    }
    
    func parseResponse(data: Data?) -> [Article] {
        
        if let encodedData = data {
            do {
                let articlesArray = try JSONDecoder().decode([Article].self,
                                                            from: encodedData)
                print(articlesArray.count)
                return articlesArray

            } catch {
                print("Cant read data")
                return []
            }
        }
        return []
    }
}
