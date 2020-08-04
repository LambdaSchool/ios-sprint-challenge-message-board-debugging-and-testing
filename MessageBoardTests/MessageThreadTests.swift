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

   func testFetchingMessageThreads() {
        let messageController = MessageThreadController()
    messageController.fetchMessageThreads {
        XCTAssert(!messageController.messageThreads.isEmpty)
    }
    }

    func testCreatingMessageThread() {
        let title = "Title"
        let createMessage = MessageThread(title: title)
        XCTAssertNotNil(createMessage)
    }

    func testCreateAMessage() {
        let text = "Text"
        let sender = "Sender"
        let createMessage = MessageThread.Message(text: text, sender: sender)
        XCTAssertNotNil(createMessage)
    }
    
}
