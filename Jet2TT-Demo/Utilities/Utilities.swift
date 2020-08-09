//
//  Utilities.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 Tejas Patelia. All rights reserved.
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
    
    class func returnHigherNumericValue(likes_comments: Int) -> String {
        if likes_comments < 500 { return "\(likes_comments)" }
        
        let value = (Double(likes_comments)/1000.0)
        var newVal = round(value*10)/10
        let anotherval = newVal.truncatingRemainder(dividingBy: 1)
        newVal = anotherval >= 0.5 ? (newVal+1) : newVal
        return "\(Int(newVal))K"
    }
    
    class func convertFromISODate(strDate: String) -> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from:strDate)
        return date
    }
    
    class func calculateDateDifference(toDate: Date, fromDate: Date) -> String{
        
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.year,.month,.weekOfMonth,.day,.hour,.minute,.second]
        dateComponentsFormatter.maximumUnitCount = 1
        dateComponentsFormatter.unitsStyle = .full
        let str = dateComponentsFormatter.string(from: fromDate, to: toDate)
        return str ?? ""
    }
}

