//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {

    let title: String
    var messages: [MessageThread.Message]
    let identifier: String

    init(title: String, messages: [MessageThread.Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }
    
    // MARK: Bug 3 - error decoding messages
    // Bug 3, change 1: added coding keys
    enum MessageThreadKeys: String, CodingKey {
        case title
        case messages
        case identifier
    }
    
    enum MessageKeys: String, CodingKey {
        case messageText = "text"
        case sender
        case timestamp
    }


    required init(from decoder: Decoder) throws {
        // Bug 3, change 2: changed CodingKeys.self to MessageThreadKeys.self
        let container = try decoder.container(keyedBy: MessageThreadKeys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        // Bug 3, change 3: removed next line
//        let messages = try container.decodeIfPresent([Message].self, forKey: .messages) ?? []
        
        let messagesDictionary: [String : Message] = try container.decodeIfPresent([String : Message].self, forKey: .messages) ?? [:]
        
        var messages: [Message] = []
        if messagesDictionary.count > 0 {
            messages = Array(messagesDictionary.values)
        }
        
        self.title = title
        self.identifier = identifier
        self.messages = messages
    }

    
    struct Message: Codable, Equatable {
        
        let messageText: String
        let sender: String
        let timestamp: Date
        
        init(text: String, sender: String, timestamp: Date = Date()) {
            self.messageText = text
            self.sender = sender
            self.timestamp = timestamp
        }
        
        // Bug 3, change 3: added decoding initializer
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: MessageKeys.self)
            let messageText = try container.decode(String.self, forKey: .messageText)
            let sender = try container.decode(String.self, forKey: .sender)
            let timestamp = try container.decode(Date.self, forKey: .timestamp)
            self.messageText = messageText
            self.sender = sender
            self.timestamp = timestamp
        }
        
        // MARK: Bug 5 - error encoding Messages
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: MessageKeys.self)
            try container.encode(messageText, forKey: .messageText)
            try container.encode(sender, forKey: .sender)
            try container.encode(timestamp, forKey: .timestamp)
        }
    }
    
    static func ==(lhs: MessageThread, rhs: MessageThread) -> Bool {
        return lhs.title == rhs.title &&
            lhs.identifier == rhs.identifier &&
            lhs.messages == rhs.messages
    }
}
