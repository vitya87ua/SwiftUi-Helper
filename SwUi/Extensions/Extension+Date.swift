//
//  Extension+Date.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 18.03.2022.
//

import Foundation

extension Date {
    
    enum Unit {
        case seconds
        case minutes
        case hours
        case day
    }
    
    static func getCurrentTime(stringFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = stringFormat
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    static func getDifferenceIn(unit: Unit, startDate: Date, endDate: Date) -> Int {
        
        var differenceValue: Int = 0
        
        switch unit {
            
        case .seconds:
            let calendar = Calendar.current.dateComponents([.second], from: startDate, to: endDate)
            differenceValue = calendar.second ?? 0
        case .minutes:
            let calendar = Calendar.current.dateComponents([.minute], from: startDate, to: endDate)
            differenceValue = calendar.minute ?? 0
        case .hours:
            let calendar = Calendar.current.dateComponents([.hour], from: startDate, to: endDate)
            differenceValue = calendar.hour ?? 0
        case .day:
            let calendar = Calendar.current.dateComponents([.day], from: startDate, to: endDate)
            differenceValue = calendar.day ?? 0
        }
        
        return differenceValue
    }
    
    static func getDifferenceIn(unit: Unit, startDate: String, endDate: String) -> Int {
        
        let sDate: Date = Date.stringToDate(fromDate: startDate)
        let eDate: Date = Date.stringToDate(fromDate: endDate)
        
        var differenceValue: Int = 0
        
        switch unit {
            
        case .seconds:
            let calendar = Calendar.current.dateComponents([.second], from: sDate, to: eDate)
            differenceValue = calendar.second ?? 0
        case .minutes:
            let calendar = Calendar.current.dateComponents([.minute], from: sDate, to: eDate)
            differenceValue = calendar.minute ?? 0
        case .hours:
            let calendar = Calendar.current.dateComponents([.hour], from: sDate, to: eDate)
            differenceValue = calendar.hour ?? 0
        case .day:
            let calendar = Calendar.current.dateComponents([.day], from: sDate, to: eDate)
            differenceValue = calendar.day ?? 0
        }
        
        return differenceValue
    }
    
    static func add(_ value: Int, unit: Unit, toDate: Date) -> Date {
        
        var date: Date?
        
        switch unit {
            
        case .seconds:
            date = Calendar.current.date(byAdding: .second, value: value, to: toDate)
        case .minutes:
            date = Calendar.current.date(byAdding: .minute, value: value, to: toDate)
        case .hours:
            date = Calendar.current.date(byAdding: .hour, value: value, to: toDate)
        case .day:
            date = Calendar.current.date(byAdding: .day, value: value, to: toDate)
        }
        
        if let newDate = date {
            return newDate
        } else {
            print(#fileID, #function, #line, "Bad time format!")
            return Date(timeIntervalSince1970: 0)
        }
    }
    
    static func stringToDate(fromDate date: String) -> Date {
        let format = getDateFormatter(false)
        
        if let newDate = format.date(from: date) {
            return newDate
        } else {
            print(#fileID, #function, #line, "Bad time format! -> ", date)
            return Date(timeIntervalSince1970: 0)
        }
    }
    
    static func currentDateString(dateOnly: Bool = false) -> String {
        let formatter = getDateFormatter(dateOnly)
        return formatter.string(from: Date())
    }
    
    static func toString(date: Date, dateOnly: Bool = false) -> String {
        let format = getDateFormatter(dateOnly)
        format.dateFormat = dateOnly ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm:ss"
        return format.string(from: date )
    }
    
    static func timeOnly(fromDate date: String) -> String {
        let format = getDateFormatter(false)
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateTime = format.date(from: date)
        format.dateFormat = "HH:mm:ss"
        return format.string(from: dateTime ?? Date())
    }
    
    static func dateOnly(fromDate date: String) -> String {
        let format = getDateFormatter(false)
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateTime = format.date(from: date)
        format.dateFormat = "yyyy-MM-dd"
        return format.string(from: dateTime ?? Date())
    }
    
    static func getTimeFromMinutes(minutes: Int) -> String { // 20:26
        let hours = minutes / 60
        let minutes = minutes % 60
        return String(format: "%02d:%02d", hours, minutes)
    }
    
    static func getTimeFromMinutes(minutes: Int16) -> String { // 20:26
        let hours = minutes / 60
        let minutes = minutes % 60
        return String(format: "%02d:%02d", hours, minutes)
    }
    
    static func getTimeFrom(seconds: Int, withSeconds: Bool = false) -> String { // 20:26 || 20:26:03
        let hours = seconds / 3600
        let minutes = seconds % 3600 / 60
        let sec = seconds % 60
        
        if withSeconds {
            return String(format: "%02d:%02d:%02d", hours, minutes, sec)
        } else {
            return String(format: "%02d:%02d", hours, minutes)
        }
    }
    
    static func breakTimeTo(seconds: String) -> Int { // "01:22:05" -> 4925
        let stringArray = seconds.components(separatedBy: ":")
        var seconds = 0
        for (offset, element) in stringArray.enumerated() {
            if let int = Int(element) {
                switch offset {
                case 0: seconds += int * 60 * 60
                case 1: seconds += int * 60
                case 2: seconds += int
                default: break
                }
            }
        }
        return seconds
    }
    
    static func newDate() -> Date {
        stringToDate(fromDate: getCurrentDateTime())
    }
    
    static func getCurrentDateTime(_ dateOnly: Bool = false) -> String {
        let formatter = getDateFormatter(dateOnly)
        return formatter.string(from: Date())
    }
    
    static func getShortDateTime(from: Date = Date(), dateOnly: Bool = false) -> String {
        let format = getDateFormatter(dateOnly)
        format.dateFormat = dateOnly
        ? "MMM d, yyyy"         // Jul 26, 2021
        : "MMM d, yyyy hh:mm a" // Jul 26, 2021 06:30 PM
        return format.string(from: from)
    }
    
    static func getTimeOnly(from: Date = Date(), withSeconds: Bool = false) -> String {
        let format = getDateFormatter(false)
        format.dateFormat = withSeconds
        ? "hh:mm:ss a"         // 06:30:45 PM
        : "hh:mm a"            // 06:30 PM
        return format.string(from: from)
    }
    
    // MARK: - DateFormatter
    static func getDateFormatter(_ dateOnly: Bool) -> DateFormatter {
        let format = DateFormatter()
        format.dateFormat = dateOnly ? "yyyy-MM-dd" : "yyyy-MM-dd HH:mm:ss"
        format.timeZone = getTimeZone()
        return format
    }
    
    // MARK: - TimeZone
    static func getTimeZone() -> TimeZone {
        TimeZone.current
    }
    
    static func getShortTimeZone() -> String {
        let timeZone: TimeZone = TimeZone.current
        return timeZone.abbreviation() ?? ""
    }
    
    static func getTimeZoneOffset() -> String {
        let timeZone = getTimeZone()
        
        // get seconds from GMT
        let offset = timeZone.secondsFromGMT()
        
        // get shortname like PDT, MDT, PST
        let shortName = timeZone.abbreviation() ?? ""
        
        // get hours from seconds
        let hour = abs(offset / 3600)
        
        // get minutes
        let minute = offset / 60 % 60
        return String(format: "%@ -%02d:%02d", shortName, hour, minute)
    }
    
    /// let timeInterval: TimeInterval = 1637921687.0 ("Nov 26, 2021 at 12:14 PM")
    /// Date(timeIntervalSince1970: timeInterval).getDateTimeUnit(.hour)  -> 12
    func getDateTimeUnit(_ unit: Calendar.Component) -> Int {
        Calendar.current.component(unit, from: self)
    }
}
