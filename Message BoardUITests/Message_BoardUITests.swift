//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    var app = XCUIApplication()

    func launch() -> XCUIApplication {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        return app
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testCreatingMessages() {
        let app = launch()

        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Thread 1"]/*[[".cells.matching(identifier: \"MessageThreadCell\").staticTexts[\"Thread 1\"]",".staticTexts[\"Thread 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Thread 1"].buttons["Add"].tap()
        app/*@START_MENU_TOKEN@*/.textFields["MessageName"]/*[[".textFields[\"Enter your name:\"]",".textFields[\"MessageName\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let messagetextTextView = app.textViews["MessageText"]
        messagetextTextView.tap()
        messagetextTextView.tap()
        app.navigationBars["New Message"].buttons["Send"].tap()

        XCTAssertEqual(app.navigationBars.staticTexts.firstMatch.label, "Thread 1")
    }

    func testMessageThreadsAppearing() {
        let app = XCUIApplication()
        let loadedThread = app.tables.cells.matching(identifier: "MessageThreadCell").staticTexts["A New Thread"]
        XCTAssertTrue(loadedThread.exists)
    }

    func testDetailViewTitle() {
        let app = XCUIApplication()
        let loadedThread = app.tables.cells.matching(identifier: "MessageThreadCell").staticTexts["A New Thread"]
        loadedThread.tap()
        XCTAssertEqual(app.navigationBars.staticTexts.firstMatch.label, "A New Thread")
    }

}
