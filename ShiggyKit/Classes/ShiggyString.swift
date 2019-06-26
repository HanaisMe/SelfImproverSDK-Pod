//
//  ShiggyString.swift
//  ShiggyKit
//
//  Created by Lee, Jeongsik on 2019/06/11.
//  Copyright © 2019 Lee, Jeongsik. All rights reserved.
//

import Foundation
import UIKit

public struct ShiggyString {
    
    private let string: String
    
    init(string: String) {
        self.string = string
    }
    
    /**
     Returns the date from string using the predefined date format, which is "yyyy"
     */
    public var toYear: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.year.rawValue
        return dateFormatter.date(from: self.string)
    }
    
    /**
     Returns the date from string using the predefined date format, which is "yyyy-MM"
     */
    public var toYearMonth: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.yearMonth.rawValue
        return dateFormatter.date(from: self.string)
    }
    
    /**
     Returns the date from string using the predefined date format, which is "yyyy-MM-dd"
     */
    public var toYearMonthDay: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.yearMonthDay.rawValue
        return dateFormatter.date(from: self.string)
    }
    
    /**
     Returns the date from string using the predefined date format, which is "MM"
     */
    public var toMonth: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.month.rawValue
        return dateFormatter.date(from: self.string)
    }
    
    /**
     Returns the date from string using the predefined date format, which is "MM-dd"
     */
    public var toMonthDay: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.monthDay.rawValue
        return dateFormatter.date(from: self.string)
    }
    
    /**
     Returns the date from string using the predefined date format, which is "dd"
     */
    public var toDay: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = NumericDateFormatType.day.rawValue
        return dateFormatter.date(from: self.string)
    }
    
    /**
     Get a localized string from the string.
     - Returns: The localized string.
     */
    public var localized: String {
        return NSLocalizedString(self.string, comment: "")
    }
    
}
