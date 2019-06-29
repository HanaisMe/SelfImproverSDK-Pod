//
//  ShiggyKit_ExampleTests.swift
//  ShiggyKit_ExampleTests
//
//  Created by Jeongsik Lee on 2019/06/26.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import ShiggyKit_Example
@testable import ShiggyKit

class ShiggyKit_ExampleTests: XCTestCase {
    
    var testVC: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let naviVC = storyboard.instantiateInitialViewController() as! UINavigationController
        let vc = naviVC.topViewController as! ViewController
        UIApplication.shared.keyWindow?.rootViewController = vc
        vc.viewDidLoad()
        vc.viewWillAppear(true)
        testVC = vc
    }
    
    override func tearDown() {
        testVC = nil
        super.tearDown()
    }
    
    func testCalendarVC() {
        XCTAssertNotNil(testVC.view)
        XCTAssertNotNil(testVC.calendarView)
        XCTAssertNotNil(testVC.headerView)
        XCTAssertNotNil(testVC.headerView.oneDayViewCollection)
        let sundayOneDayView = testVC.headerView.oneDayViewCollection.filter{ $0.tag == 1 }.first
        XCTAssertNotNil(sundayOneDayView)
        XCTAssertEqual(sundayOneDayView?.theDayLabel.text, "Sun")
        
        let thisMonthTitle = testVC.navigationController?.navigationBar.topItem?.title
        XCTAssertEqual(thisMonthTitle, testVC.resolveDate())
        
        testVC.previousMonthButtonTapped(testVC)
        let previousMonthTitle = testVC.navigationController?.navigationBar.topItem?.title
        XCTAssertEqual(previousMonthTitle, testVC.resolveDate())
        
        testVC.nextMonthButtonTapped(testVC)
        testVC.nextMonthButtonTapped(testVC)
        let nextMonthTitle = testVC.navigationController?.navigationBar.topItem?.title
        XCTAssertEqual(nextMonthTitle, testVC.resolveDate())
    }
    
    func testShiggyDate() {
        let testDateString = "1992-06-16"
        
        XCTAssertNotNil(testDateString.shiggy.toYearMonthDay)
        guard let testDate = testDateString.shiggy.toYearMonthDay else { return }
        XCTAssertEqual(testDate.shiggy.toYear, "1992")
        XCTAssertEqual(testDate.shiggy.toYearMonth, "1992-06")
        XCTAssertEqual(testDate.shiggy.toYearMonthDay, "1992-06-16")
        XCTAssertEqual(testDate.shiggy.toMonth, "06")
        XCTAssertEqual(testDate.shiggy.toMonthDay, "06-16")
        XCTAssertEqual(testDate.shiggy.toDay, "16")
        
        XCTAssertEqual(testDate.shiggy.toStringIgnoreUTC, "Tuesday, June 16, 1992")
        
        XCTAssertNotNil(testDate.shiggy.toCustomString(dateFormat: "TEST"))
        XCTAssertEqual(testDate.shiggy.toCustomString(dateFormat: "TEST"), "")
        
        let oneWeekBefore = testDate.shiggy.oneWeekBefore
        XCTAssertNotNil(testDate.shiggy.oneWeekBefore)
        XCTAssertEqual(oneWeekBefore.shiggy.toStringIgnoreUTC, "Tuesday, June 09, 1992")
        
        let twoWeeksBefore = testDate.shiggy.weeksBefore(numOfWeeks: 2)
        XCTAssertNotNil(testDate.shiggy.weeksBefore(numOfWeeks: 2))
        XCTAssertEqual(twoWeeksBefore.shiggy.toStringIgnoreUTC, "Tuesday, June 02, 1992")
        
        let oneWeekAfter = testDate.shiggy.oneWeekAfter
        XCTAssertNotNil(testDate.shiggy.oneWeekAfter)
        XCTAssertEqual(oneWeekAfter.shiggy.toStringIgnoreUTC, "Tuesday, June 23, 1992")
        
        let twoWeeksAfter = testDate.shiggy.weeksAfter(numOfWeeks: 2)
        XCTAssertNotNil(testDate.shiggy.weeksAfter(numOfWeeks: 2))
        XCTAssertEqual(twoWeeksAfter.shiggy.toStringIgnoreUTC, "Tuesday, June 30, 1992")
        
        XCTAssertNotNil(testDate.shiggy.oneMonthBefore)
        guard let oneMonthBefore = testDate.shiggy.oneMonthBefore else { return }
        XCTAssertEqual(oneMonthBefore.shiggy.toStringIgnoreUTC, "Saturday, May 16, 1992")
        
        XCTAssertNotNil(testDate.shiggy.oneMonthAfter)
        guard let oneMonthAfter = testDate.shiggy.oneMonthAfter else { return }
        XCTAssertEqual(oneMonthAfter.shiggy.toStringIgnoreUTC, "Thursday, July 16, 1992")
        
        XCTAssertNotNil(testDate.shiggy.oneYearBefore)
        guard let oneYearBefore = testDate.shiggy.oneYearBefore else { return }
        XCTAssertEqual(oneYearBefore.shiggy.toStringIgnoreUTC, "Sunday, June 16, 1991")
        
        XCTAssertNotNil(testDate.shiggy.oneYearAfter)
        guard let oneYearAfter = testDate.shiggy.oneYearAfter else { return }
        XCTAssertEqual(oneYearAfter.shiggy.toStringIgnoreUTC, "Wednesday, June 16, 1993")
        
        XCTAssertEqual(testDate.shiggy.thisMonthNumberOfDays, 30)
        
        XCTAssertNotNil(testDate.shiggy.thisMonthFirstDate)
        guard let thisMonthFirstDate = testDate.shiggy.thisMonthFirstDate else { return }
        XCTAssertEqual(thisMonthFirstDate.shiggy.toStringIgnoreUTC, "Monday, June 01, 1992")
        
        XCTAssertEqual(testDate.shiggy.thisMonthFirstWeekday, Weekday.monday)
        
        XCTAssertNotNil(testDate.shiggy.thisMonthLastDate)
        guard let thisMonthLastDate = testDate.shiggy.thisMonthLastDate else { return }
        XCTAssertEqual(thisMonthLastDate.shiggy.toStringIgnoreUTC, "Tuesday, June 30, 1992")
        
        XCTAssertEqual(testDate.shiggy.thisMonthLastWeekday, Weekday.tuesday)
        
        XCTAssertNotNil(testDate.shiggy.thisWeekFirstDate)
        guard let thisWeekFirstDate = testDate.shiggy.thisWeekFirstDate else { return }
        XCTAssertEqual(thisWeekFirstDate.shiggy.toStringIgnoreUTC, "Sunday, June 14, 1992")
        
        XCTAssertNotNil(testDate.shiggy.thisWeekLastDate)
        guard let thisWeekLastDate = testDate.shiggy.thisWeekLastDate else { return }
        XCTAssertEqual(thisWeekLastDate.shiggy.toStringIgnoreUTC, "Saturday, June 20, 1992")
        
        XCTAssertEqual(testDate.shiggy.numberOfWeeks, 5)
        
        let tenDaysLater = testDate.shiggy.getDay(daysFromToday: 10)
        XCTAssertNotNil(testDate.shiggy.getDay(daysFromToday: 10))
        XCTAssertEqual(tenDaysLater.shiggy.toStringIgnoreUTC, "Friday, June 26, 1992")
    }
    
    func testShiggyString() {
        XCTAssertNotNil("1992".shiggy.toYear)
        guard let year = "1992".shiggy.toYear else { return }
        XCTAssertEqual(year.shiggy.toStringIgnoreUTC, "Wednesday, January 01, 1992")
        
        XCTAssertNotNil("1992-06".shiggy.toYearMonth)
        guard let yearMonth = "1992-06".shiggy.toYearMonth else { return }
        XCTAssertEqual(yearMonth.shiggy.toStringIgnoreUTC, "Monday, June 01, 1992")
        
        XCTAssertNotNil("1992-06-16".shiggy.toYearMonthDay)
        guard let yearMonthDay = "1992-06-16".shiggy.toYearMonthDay else { return }
        XCTAssertEqual(yearMonthDay.shiggy.toStringIgnoreUTC, "Tuesday, June 16, 1992")
        
        XCTAssertNotNil("06".shiggy.toMonth)
        guard let month = "06".shiggy.toMonth else { return }
        XCTAssertEqual(month.shiggy.toStringIgnoreUTC, "Thursday, June 01, 2000")
        
        XCTAssertNotNil("06-16".shiggy.toMonthDay)
        guard let monthDay = "06-16".shiggy.toMonthDay else { return }
        XCTAssertEqual(monthDay.shiggy.toStringIgnoreUTC, "Friday, June 16, 2000")
        
        XCTAssertNotNil("16".shiggy.toDay)
        guard let day = "16".shiggy.toDay else { return }
        XCTAssertEqual(day.shiggy.toStringIgnoreUTC, "Sunday, January 16, 2000")
    }
    
    func testPerformance() {
        guard let testDate = "1992-06-16".shiggy.toYearMonthDay else { return }
        self.measure {
            XCTAssertEqual(testDate.shiggy.thisMonthNumberOfDays, 30)
        }
    }
    
}
