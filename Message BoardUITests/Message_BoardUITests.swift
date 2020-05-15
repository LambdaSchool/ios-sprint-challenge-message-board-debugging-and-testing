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
    
    private var newThread: XCUIElement {
        app.textFields["MessageThreadTableView.CreateThread"]
    }
    
    private func getThreadFor(_ thread: String) -> XCUIElement {
        app.staticTexts[thread]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        // NOTE: Keep this setup as is for UI Testing
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testCreatingThread() {
        newThread.tap()
        newThread.typeText("New thread\n")
        
        XCTAssert(getThreadFor("New thread").exists)
    }
}
