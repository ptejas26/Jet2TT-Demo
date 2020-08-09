//
//  Utilities.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 GlobalLogic. All rights reserved.
//


import Foundation

class Utilities {
    
    class func convertTimestampToDate(ts :Double) -> Date {
        return Date(timeIntervalSince1970: ts)
    }
    class func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat  = "EEEE"
        let myString = formatter.string(from: date as Date)
        return myString
    }
    class func dayForDate(date: Date) -> String {
        let result = Calendar.current.component(Calendar.Component.day, from: date)
        print(result)
        return "\(result)"
    }
}

