//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testChangingThreads() {
        
        let table = app.tables
        
        table.staticTexts["A New Thread"].tap()
        let title0 = app.navigationBars.staticTexts.firstMatch.label
        
        app.navigationBars.buttons["λ Message Board"].tap()
        table.staticTexts["Testing again"].tap()
        let title1 = app.navigationBars.staticTexts.firstMatch.label
        
        XCTAssertNotEqual(title0, title1)
        
        app.navigationBars.buttons["λ Message Board"].tap()
        table.staticTexts["A New Thread"].tap()
        let title0a = app.navigationBars.staticTexts.firstMatch.label
        
        XCTAssertEqual(title0, title0a)
    }
    
    func testCreatingThread() {
        
        app.textFields["Create a new thread:"].tap()
        
        app.keys["a"].tap()
        app.buttons["Return"].tap()
        
        app.tables.staticTexts["a"].tap()
        let title = app.navigationBars.staticTexts.firstMatch.label
        XCTAssertEqual(title, "a")
    }
    
    func testCreatingMessage() {
        
        app.tables.staticTexts["A New Thread"].tap()
        app.buttons["Add"].tap()
        
        app.textFields["Enter your name:"].tap()
        app.keys["a"].tap()
        
        app.textViews.firstMatch.tap()
        app.keys["B"].tap()
        app.buttons["Send"].tap()
        
        XCTAssertEqual(app.navigationBars.staticTexts.firstMatch.label, "A New Thread")
        
        // Tapping the label to ensure the message exists
        app.tables.staticTexts["B"].tap()
    }
    
    func testCorrectInformation() {
        let table = app.tables
        
        table.staticTexts["A New Thread"].tap()
        // Tapping the label to ensure the message exists
        app.tables.staticTexts["Checking to make sure this works."].tap()
        
        app.navigationBars.buttons["λ Message Board"].tap()
        
        table.staticTexts["Testing again"].tap()
        // Tapping the label to ensure the message exists
        app.tables.staticTexts["It’s working!"].tap()
    }
}
