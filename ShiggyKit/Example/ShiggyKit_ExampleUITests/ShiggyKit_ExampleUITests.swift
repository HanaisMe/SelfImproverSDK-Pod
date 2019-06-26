//
//  ShiggyKit_ExampleUITests.swift
//  ShiggyKit_ExampleUITests
//
//  Created by Jeongsik Lee on 2019/06/26.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest

class ShiggyKit_ExampleUITests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
    }
    
    func testPreviousAndNextMonthButton() {
        let app = XCUIApplication()
        
        app.buttons["PREVIOUS_MONTH_BUTTON"].tap()
        app.windows.firstMatch.screenshot()
        XCUIScreen.main.screenshot()
        
        app.buttons["NEXT_MONTH_BUTTON"].tap()
        app.windows.firstMatch.screenshot()
        XCUIScreen.main.screenshot()
        
        app.buttons["NEXT_MONTH_BUTTON"].tap()
        app.windows.firstMatch.screenshot()
        XCUIScreen.main.screenshot()
    }
    
    func testOneDaySelection() {
        let app = XCUIApplication()
        app.buttons["PREVIOUS_MONTH_BUTTON"].tap()
        app.tables.staticTexts["07"].tap() //2019-05-07
        
        app.alerts["Selected day is...!"].buttons["OK"].tap()
        
        app.buttons["PREVIOUS_MONTH_BUTTON"].tap()
        app.tables.staticTexts["12"].tap() //2019-04-12
        app.alerts["Selected day is...!"].buttons["OK"].tap()
    }
    
}
