//
//  UserDefaultManager.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 GlobalLogic. All rights reserved.
//


import Foundation
import CoreLocation
//extension UserDefaults {
//    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
//        guard let data = self.value(forKey: key) as? Data else { return nil }
//        return try? decoder.decode(type.self, from: data)
//    }
//
//    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
//        let data = try? encoder.encode(object)
//        self.set(data, forKey: key)
//    }
//}

//class UserDefaultManager : NSObject {
//
//    func setPinnedDetails(_ pinnedDetails: [String: Any]) {
//        //print(pinnedDetails)
//        var arr = getPinnedDetails()
//        arr.append(pinnedDetails)
//
//        if #available(iOS 12.0, *) {
//            do {
//                let data = try NSKeyedArchiver.archivedData(withRootObject: arr, requiringSecureCoding: true)
//                UserDefaults.standard.set(data, forKey: Constant.UserDefaultKey.PINNED_USER_DETAILS)
//                print("Success")
//                UserDefaults.standard.synchronize()
//            } catch {
//                return
//            }
//        } else {
//            let data = NSKeyedArchiver.archivedData(withRootObject: arr)
//            UserDefaults.standard.set(data, forKey: Constant.UserDefaultKey.PINNED_USER_DETAILS)
//            UserDefaults.standard.synchronize()
//        }
//
//    }
//
//    func getPinnedDetails() -> [[String: Any]] {
//
//        guard let mainData = UserDefaults.standard.object(forKey: Constant.UserDefaultKey.PINNED_USER_DETAILS) as? Data else {
//            print(" data not found in UserDefaults")
//            return [[String: Any]]()
//        }
//        UserDefaults.standard.synchronize()
//        if #available(iOS 12.0, *) {
//            do {
//                guard let unarchivedFavorites = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(mainData) else {return [[String: Any]]()}
//                let newarray = unarchivedFavorites as! [[String: Any]]
//                return newarray
//            } catch {
//                return [[String: Any]]()
//            }
//
//        } else {
//            guard let mainData = UserDefaults.standard.object(forKey: Constant.UserDefaultKey.PINNED_USER_DETAILS) as? NSData else {
//                print(" data not found in UserDefaults")
//                return [[String: Any]]()
//            }
//            if let unarchivedFavorites = NSKeyedUnarchiver.unarchiveObject(with: mainData as Data) as? [[String: Any]] {
//                let newarray = unarchivedFavorites
//                return newarray
//            }
//            //unarchiveObject(with: recovedUserJsonData)
//
//            //        if let outData = UserDefaultManager.userDefaults().array(forKey: Constant.UserDefaultKey.PINNED_USER_DETAILS) as? [[String: Any]] {
//            //            return outData
//            //        }
//        }
//        return [[String: Any]]()
//    }
//}
