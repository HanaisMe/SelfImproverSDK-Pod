//
//  ShiggyDate.swift
//  ShiggyKit
//
//  Created by Lee, Jeongsik on 2019/06/11.
//  Copyright © 2019 Lee, Jeongsik. All rights reserved.
//

import Foundation
import UIKit

/**
 Enumeration containing numeric types of date formats.
 */
internal enum NumericDateFormatType: String {
    case year         = "yyyy"
    case yearMonth    = "yyyy-MM"
    case yearMonthDay = "yyyy-MM-dd"
    case month        = "MM"
    case monthDay     = "MM-dd"
    case day          = "dd"
}

/**
 Enumeration containing weekdays.
 */
public enum Weekday: Int {
    case sunday    = 1
    case monday    = 2
    case tuesday   = 3
    case wednesday = 4
    case thursday  = 5
    case friday    = 6
    case saturday  = 7
}

public struct ShiggyDate {
    
    private let date: Date
    init(date: Date) {
        self.date = date
    }
    
    /**
     Returns the Weekday type of the given date.
     */
    private var toWeekday: Weekday? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        dateFormatter.locale = Locale(identifier: "en_US")
        switch dateFormatter.string(from: self.date) {
        case "Sun":
            return Weekday.sunday
        case "Mon":
            return Weekday.monday
        case "Tue":
            return Weekday.tuesday
        case "Wed":
            return Weekday.wednesday
        case "Thu":
            return Weekday.thursday
        case "Fri":
            return Weekday.friday
        case "Sat":
            return Weekday.saturday
        default:
            return nil
        }
    }
    
    /**
     Returns the string from date using the predefined date format, which is "yyyy"
     */
    public var toYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.year.rawValue
        return dateFormatter.string(from: self.date)
    }
    
    /**
     Returns the string from date using the predefined date format, which is "yyyy-MM"
     */
    public var toYearMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.yearMonth.rawValue
        return dateFormatter.string(from: self.date)
    }
    
    /**
     Returns the string from date using the predefined date format, which is "yyyy-MM-dd"
     */
    public var toYearMonthDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.yearMonthDay.rawValue
        return dateFormatter.string(from: self.date)
    }
    
    /**
     Returns the string from date using the predefined date format, which is "MM"
     */
    public var toMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.month.rawValue
        return dateFormatter.string(from: self.date)
    }
    
    /**
     Returns the string from date using the predefined date format, which is "MM-dd"
     */
    public var toMonthDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.monthDay.rawValue
        return dateFormatter.string(from: self.date)
    }
    
    /**
     Returns the string from date using the predefined date format, which is "dd"
     */
    public var toDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.day.rawValue
        return dateFormatter.string(from: self.date)
    }
    
    /**
     Returns the string from date using the date format of the parameter.
     - Parameter dateFormat: The date format you want to use.
     - Returns: The formatted date in String.
     */
    public func toCustomString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self.date)
    }
    
    /**
     Returns the date of one week before.
     */
    public var oneWeekBefore: Date {
        return self.date.shiggy.getDay(daysFromToday: -7)
    }
    
    /**
     Returns the date of N week(s) before.
     */
    public func weeksBefore(numOfWeeks: Int) -> Date {
        return self.date.shiggy.getDay(daysFromToday: -7 * numOfWeeks)
    }
    
    /**
     Returns the date of one week after.
     */
    public var oneWeekAfter: Date {
        return self.date.shiggy.getDay(daysFromToday: 7)
    }
    
    /**
     Returns the date of N week(s) before.
     */
    public func weeksAfter(numOfWeeks: Int) -> Date {
        return self.date.shiggy.getDay(daysFromToday: 7 * numOfWeeks)
    }
    
    /**
     Returns the date of one month before.
     */
    public var oneMonthBefore: Date? {
        guard let year = Int(self.date.shiggy.toYear), let month = Int(self.date.shiggy.toMonth), let day = Int(self.date.shiggy.toDay) else {
            return nil
        }
        let oneMonthBeforeString = month < 2 ? "\(year - 1)-12-\(day)" : "\(year)-\(month - 1)-\(day)"
        return oneMonthBeforeString.shiggy.toYearMonthDay
    }
    
    /**
     Returns the date of one month after.
     */
    public var oneMonthAfter: Date? {
        guard let year = Int(self.date.shiggy.toYear), let month = Int(self.date.shiggy.toMonth), let day = Int(self.date.shiggy.toDay) else {
            return nil
        }
        let oneMonthAfterString = month > 11 ? "\(year + 1)-01-\(day)" : "\(year)-\(month + 1)-\(day)"
        return oneMonthAfterString.shiggy.toYearMonthDay
    }
    
    /**
     Returns the date of one year before.
     */
    public var oneYearBefore: Date? {
        guard let year = Int(self.date.shiggy.toYear), let month = Int(self.date.shiggy.toMonth), let day = Int(self.date.shiggy.toDay) else {
            return nil
        }
        let date = "\(year - 1)-\(month)-\(day)"
        return date.shiggy.toYearMonthDay
    }
    
    /**
     Returns the date of one year after.
     */
    public var oneYearAfter: Date? {
        guard let year = Int(self.date.shiggy.toYear), let month = Int(self.date.shiggy.toMonth), let day = Int(self.date.shiggy.toDay) else {
            return nil
        }
        let date = "\(year + 1)-\(month)-\(day)"
        return date.shiggy.toYearMonthDay
    }
    
    /**
     Returns the number of days in the month of the date.
     */
    public var thisMonthNumberOfDays: Int? {
        if let year = Int(self.date.shiggy.toYear), let month = Int(self.date.shiggy.toMonth) {
            let tempLastDayString = month > 11 ? "\(year + 1)-01-01" : "\(year)-\(month + 1)-01"
            if let tempLastDay = tempLastDayString.shiggy.toYearMonthDay {
                let lastDay = tempLastDay.shiggy.getDay(daysFromToday: -1)
                return Int(lastDay.shiggy.toDay)
            }
            return nil
        }
        return nil
    }
    
    /**
     Returns the first date in the month of the date.
     */
    public var thisMonthFirstDate: Date? {
        guard let year = Int(self.date.shiggy.toYear), let month = Int(self.date.shiggy.toMonth),
            let firstDate = "\(year)-\(month)-01".shiggy.toYearMonthDay else { return nil }
        return firstDate
    }
    
    /**
     Returns the weekday type of the first date in the month of the date.
     */
    public var thisMonthFirstWeekday: Weekday? {
        guard let firstDate = self.date.shiggy.thisMonthFirstDate,
            let firstWeekday = firstDate.shiggy.toWeekday else { return nil }
        return firstWeekday
    }
    
    /**
     Returns the last date in the month of the date.
     */
    public var thisMonthLastDate: Date? {
        guard let year = Int(self.date.shiggy.toYear), let month = Int(self.date.shiggy.toMonth),
            let thisMonthNumberOfDays = self.date.shiggy.thisMonthNumberOfDays,
            let lastDate = "\(year)-\(month)-\(thisMonthNumberOfDays)".shiggy.toYearMonthDay else {
                return nil
        }
        return lastDate
    }
    
    /**
     Returns the weekday type of the last date in the month of the date.
     */
    public var thisMonthLastWeekday: Weekday? {
        guard let lastDate = self.date.shiggy.thisMonthLastDate, let lastWeekday = lastDate.shiggy.toWeekday else {
                return nil
        }
        return lastWeekday
    }
    
    /**
     Returns the first date in the week of the date.
     */
    public var thisWeekFirstDate: Date? {
        guard let theWeekday = self.date.shiggy.toWeekday else { return nil }
        return self.date.shiggy.getDay(daysFromToday: -(theWeekday.rawValue - Weekday.sunday.rawValue))
    }
    
    /**
     Returns the last date in the week of the date.
     */
    public var thisWeekLastDate: Date? {
        guard let theWeekday = self.date.shiggy.toWeekday else { return nil }
        return self.date.shiggy.getDay(daysFromToday: (Weekday.saturday.rawValue - theWeekday.rawValue))
    }
    
    /**
     Returns the number of weeks in the month of the date. (A week starts from Sunday.)
     */
    public var numberOfWeeks: Int? {
        guard let thisMonthNumberOfDays = self.date.shiggy.thisMonthNumberOfDays,
            let firstWeekday = self.date.shiggy.thisMonthFirstWeekday?.rawValue,
            let lastWeekday = self.date.shiggy.thisMonthLastWeekday?.rawValue else {
            return nil
        }
        return (thisMonthNumberOfDays - (lastWeekday + (7 - firstWeekday + 1)))/7 + 2
    }
    
    /**
     Returns the string from date using the date format of the parameter.
     - Parameter dateFormat: The date format you want to use.
     - Returns: The formatted date in String.
     */
    public func getDay(daysFromToday: Int) -> Date {
        return self.date.addingTimeInterval(Double(24 * 60 * 60 * daysFromToday))
    }
    
    /**
     Returns the string from date ignoring localized time.
     */
    public var toStringIgnoreUTC: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        return dateFormatter.string(from: self.date)
    }
    
}
