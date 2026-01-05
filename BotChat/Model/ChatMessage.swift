//
//  ChatMessage.swift
//  BotChat
//
//  Created by Antonius George on 05/01/26.
//

import Foundation
import SwiftData

@Model
final class ChatMessage {
    public init(timestamp: Date, sender: String, recipient: String, message: String) {
        self.timestamp = timestamp
        self.sender = sender
        self.recipient = recipient
        self.message = message
    }
    
    var timestamp: Date
    var sender: String
    var recipient: String
    var message: String
    
    public var isCurrentUser: Bool {
        return sender.caseInsensitiveCompare("you") == .orderedSame
    }

}
