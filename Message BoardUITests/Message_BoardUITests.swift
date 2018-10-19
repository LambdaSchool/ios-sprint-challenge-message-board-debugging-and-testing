//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    
    let newThread = "A New Thread"
    let testingAgain = "Testing again"
    let messageBoard = "λ Message Board"
    let newMessage = "New Message"
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    /// Tests making a new thread
    func testMakingNewThread() {
        let title1 = "Test Thread"
        let title2 = "Second Test Thread"
        MessageThreadTVCTestPage(testCase: self)
        .createNewThread(title1)
        .cellExists(title1)
        .createNewThread(title2)
        .cellExists(title2)
    }
    
    /// Tests navigating back and forth between threads
    func testTappingOnThread() {
        MessageThreadTVCTestPage(testCase: self)
        .titleDisplays(messageBoard)
        .cellExists(newThread)
        .cellExists(testingAgain)
        .tapCell(newThread)
        .cellExists("Checking to make sure this works.")
        .titleDisplays(newThread)
        .tapBackButton()
        .titleDisplays(messageBoard)
        .tapCell(testingAgain)
        .cellExists("It’s working!")
        .titleDisplays(testingAgain)
        .tapBackButton()
        .titleDisplays(messageBoard)
    }
    
    /// Tests adding a new message to a thread.
    func testAddingNewMessage() {
        MessageThreadTVCTestPage(testCase: self)
        .tapCell(newThread)
        .titleDisplays(newThread)
        .numberOfCellsIs(1)
        .tapAddButton()
        .titleDisplays(newMessage)
        .writeName("Dillon")
        .writeMessage("This is the second message on this thread.")
        .tapSendButton()
        .titleDisplays(newThread)
        .numberOfCellsIs(2)
    }
    
    /// Tests starting to make a new message, but backing out.
    func testNotAddingNewMessage() {
        MessageThreadTVCTestPage(testCase: self)
            .tapCell(newThread)
            .titleDisplays(newThread)
            .numberOfCellsIs(1)
            .tapAddButton()
            .titleDisplays(newMessage)
            .writeName("Dillon")
            .writeMessage("This is the second message on this thread.")
            .tapBackButton()
            .titleDisplays(newThread)
            .numberOfCellsIs(1)
            .tapBackButton()
            .titleDisplays(messageBoard)
    }
}
