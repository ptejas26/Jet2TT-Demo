//
//  APIManager.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 GlobalLogic. All rights reserved.
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



//    func getMethod(url:String, completeionHanlder : @escaping ( (DefaultDataResponse)-> ()) ){
//        Alamofire.request(baseURL+url).response { (response) in
//            if response.error == nil {
//                completeionHanlder(response)
//            }
//        }
//    }
//
//    func getRequestMethod(url:String, completetionHandlerNew : @escaping ((WeatherModel)->())) {
//        Alamofire.request(url).response { (response) in
//
//            if response.error == nil {
//                //print(response)
//                if let data = response.data {
//                    let str = String(decoding: data, as: UTF8.self)
//                    print("Str --> \(str)")
//                    if let dic = self.convertToDictionary(text: str) {
//                        let reponse = self.parseResponse(data:dic as [String : AnyObject])
//                        completetionHandlerNew(reponse)
//                    }
//                }
//            }
//        }
//    }
//
//    func parseResponse(data : [String:AnyObject]) -> WeatherModel {
//        let weatherObj : WeatherModel = WeatherModel()
//        if let city = data["city"] as? NSDictionary {
//            weatherObj.city?.country = city.value(forKey: "country") as? String ?? ""
//            weatherObj.city?.name = city.value(forKey: "name") as? String ?? ""
//
//            if let coords = city.value(forKey: "coord") as? NSDictionary  {
//                weatherObj.city?.coord?.lat = coords.value(forKey: "lat") as? Double ?? 0.0
//                weatherObj.city?.coord?.lon = coords.value(forKey: "lon") as? Double ?? 0.0
//            }
//        }
//
//        if let list = data["list"] as? [NSDictionary] {
//            var listArr = [List]()
//
//            for item in list {
//                var listObj = List()
//
//                if let cld = item.value(forKey: "clouds") as? NSDictionary {
//                    listObj.clouds?.all = cld.value(forKey: "all") as? Int ?? 0
//                }
//                listObj.dt = item.value(forKey: "dt") as? Int
//                listObj.dtTxt = item.value(forKey: "dt_txt") as? String
//                if let main = item.value(forKey: "main") as? NSDictionary {
//                    listObj.main?.temp = main.value(forKey: "temp") as? Double
//                    listObj.main?.feelsLike = main.value(forKey: "feels_like") as? Double
//                    listObj.main?.tempMin = main.value(forKey: "temp_min") as? Double
//                    listObj.main?.tempMax = main.value(forKey: "temp_max") as? Double
//                    listObj.main?.pressure = main.value(forKey: "pressure") as? Int ?? 0
//
//                    listObj.main?.seaLevel = main.value(forKey: "sea_level") as? Int ?? 0
//                    listObj.main?.grndLevel = main.value(forKey: "grnd_level") as? Int ?? 0
//                    listObj.main?.humidity = main.value(forKey: "humidity") as? Int ?? 0
//                    listObj.main?.tempKf = main.value(forKey: "temp_kf") as? Double ?? 0.0
//                }
//                if let rain = item.value(forKey: "rain") as? NSDictionary {
//                    listObj.rain?.h3 = rain.value(forKey: "3h") as? Float ?? 0.0
//                }
//
//                if let sys = item.value(forKey: "sys") as? NSDictionary {
//                    listObj.sys?.pod = sys.value(forKey: "pod") as? String ?? ""
//                }
//
//                if let weather = item.value(forKey: "weather") as? [NSDictionary] {
//                    var weatherArr = [Weather]()
//
//                    for wItem in weather {
//                        var weather = Weather()
//                        weather.id = wItem.value(forKey: "id") as? Int ?? 0
//                        weather.main = wItem.value(forKey: "main") as? String ?? ""
//                        weather.descriptionField = wItem.value(forKey: "description") as? String ?? ""
//                        weather.icon = wItem.value(forKey: "icon") as? String ?? ""
//                        weatherArr.append(weather)
//                    }
//                    listObj.weather = weatherArr
//                }
//
//                if let wind = item.value(forKey: "wind") as? NSDictionary {
//                    listObj.wind?.speed = wind.value(forKey: "wind") as? Float ?? 0.0
//                    listObj.wind?.deg = wind.value(forKey: "deg") as? Int ?? 0
//                }
//                listArr.append(listObj)
//            }
//            weatherObj.list = listArr
//        }
//        return weatherObj
//    }
//
//    func convertToDictionary(text: String) -> [String: Any]? {
//        if let data = text.data(using: .utf8) {
//            do {
//                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        return nil
//    }
//}
