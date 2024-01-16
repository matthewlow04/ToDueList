//
//  DateFormatting.swift
//  ToDueList
//
//  Created by Matthew Low on 2024-01-15.
//

import Foundation

func timeLeft(date: Date) -> String {
    let minutes = Int(date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    if days < 0{
        return "Times Up!"
    }
    else if days < 1 {
        return "Complete by today"
    }
    else if days < 2{
        return "Complete by tomorrow"
    }
    else{
        return "Complete in \(days) days"
    }
}

func setDate(month: Int, day: Int, year: Int) -> Date{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let dateString = "\(year)-\(month)-\(day)"
    let expirationDate = dateFormatter.date(from: dateString)
    return expirationDate ?? Date.now
}
