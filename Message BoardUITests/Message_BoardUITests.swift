//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
    
    func testNewAttempt() {
        let app = XCUIApplication()

        let createthreadfieldTextField = XCUIApplication().tables/*@START_MENU_TOKEN@*/.textFields["createthreadfield"]/*[[".textFields[\"Create a new thread:\"]",".textFields[\"createthreadfield\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        createthreadfieldTextField.tap()
        createthreadfieldTextField.typeText("New Testing Thread")
    
        
        XCTAssertEqual(app.tables.cells["AccThreadCell"].label , "New Testing Thread")
        
        
        
    }
    
}
