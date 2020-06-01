//
//  MessageThread.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MessageThread: Codable, Equatable {
    
    // Created Message Thread Coding Keys
    enum MessageThreadKeys: String, CodingKey {
        case title
        case messages
        case identifier
    }
    
    // Creates Message Coding Keys
    enum MessageKeys: String, CodingKey {
        case messageText = "text"
        case sender
        case timestamp
    }

    let title: String
    var messages: [MessageThread.Message]
    let identifier: String

    init(title: String, messages: [MessageThread.Message] = [], identifier: String = UUID().uuidString) {
        self.title = title
        self.messages = messages
        self.identifier = identifier
    }

    required init(from decoder: Decoder) throws {
        
        // MARK: Bug - decoder isn't using the correct coding keys(Bug 3)
        let container = try decoder.container(keyedBy: MessageThreadKeys.self)
        
        // Bug Note: Adding the proper coding keys decodes the title and identifier correctly.
        // messages is not decoding properly. Looks like it needs to be a dictionary
        let title = try container.decode(String.self, forKey: .title)
        let identifier = try container.decode(String.self, forKey: .identifier)
        
        let dictionaryOfMessages: [String : Message] = try container.decodeIfPresent([String : Message].self, forKey: .messages) ?? [:]
        
        var messages: [Message] = []
        
        if dictionaryOfMessages.count > 0 {
            messages = Array(dictionaryOfMessages.values)
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
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: MessageKeys.self)
            let messageText = try container.decode(String.self, forKey: .messageText)
            let sender = try container.decode(String.self, forKey: .sender)
            let timestamp = try container.decode(Date.self, forKey: .timestamp)
            self.messageText = messageText
            self.sender = sender
            self.timestamp = timestamp
        }
        
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
