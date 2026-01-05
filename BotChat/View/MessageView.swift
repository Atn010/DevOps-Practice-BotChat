//
//  MessageView.swift
//  BotChat
//
//  Created by Antonius George on 05/01/26.
//

import SwiftUI

struct MessageView : View {
    var currentMessage: ChatMessage
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if currentMessage.isCurrentUser {
                Spacer()
            }
            ContentMessageView(contentMessage: currentMessage.message,
                               isCurrentUser: currentMessage.isCurrentUser)
        }.padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(currentMessage: .init(timestamp: Date(), sender: "Bot", recipient: "You", message: "Hello"))
    }
}


struct ContentMessageView: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}

