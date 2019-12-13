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
    
    func testCreateNewMessageThread() {
        let threadTextField = app.tables.textFields["MessageThreadTVC.CreateThread"]
      
        let testThread = "Message Thread!"
        let testThreadCell = app.tables.cells.staticTexts[testThread]
        
        threadTextField.tap()
        threadTextField.typeText(testThread)
        app.keyboards.buttons["return"].tap()
        XCTAssertTrue(testThreadCell.exists)
    }
    
}
