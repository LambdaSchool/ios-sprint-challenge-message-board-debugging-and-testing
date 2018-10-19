//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    var messageThreadController = MessageThreadController()
    
    override func setUp() {
        messageThreadController = MessageThreadController()
    }
    
    /// Tests Creating a New Thread
    func testCreatingNewThread() {
        let string = "Test Thread"
        let numberOfMessages = messageThreadController.messageThreads.count
        messageThreadController.createMessageThread(with: string) {
            XCTAssertEqual(self.messageThreadController.messageThreads.count, numberOfMessages + 2)
        }
    }
    
    /// Test Fetching Threads
    func testFetchingThreads() {
        messageThreadController.fetchMessageThreads {
            XCTAssertEqual(self.messageThreadController.messageThreads.count, 0)
        }
    }
    
}
