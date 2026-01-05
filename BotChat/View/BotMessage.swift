//
//  BotMessage.swift
//  BotChat
//
//  Created by Antonius George on 05/01/26.
//

import SwiftUI
import SwiftData

struct BotMessage: View {
    @Environment(\.modelContext) private var modelContext
    var botModel: BotModel
    @Query private var items: [ChatMessage]
    @State var typedMessage: String = ""
    
    var sampleData: [ChatMessage] = [
        .init(timestamp: .distantPast, sender: "Me", recipient: "You", message: "Hello"),
        .init(timestamp: .distantPast, sender: "You", recipient: "Bot", message: "Hi"),
        .init(timestamp: .distantPast, sender: "Me", recipient: "You", message: "Wassup"),
        .init(timestamp: .distantPast, sender: "You", recipient: "Bot", message: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."),
    ]
    
    
    
    var body: some View {
        VStack {
            List{
                ForEach(items
                    .filter({
                        $0.sender.caseInsensitiveCompare(botModel.name) == .orderedSame
                        || $0.recipient.caseInsensitiveCompare(botModel.name) == .orderedSame
                    })
                    .sorted(by: { $0.timestamp < $1.timestamp })) { item in
                    MessageView(currentMessage: item)
                        .listRowSeparatorTint(.clear, edges: .all)
                }
                /*
                 Text(model.timestamp).rotationEffect(Angle(degrees: 180)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                 }.rotationEffect(Angle(degrees: 180)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)*/
            }
            HStack {
                                TextField("Message...", text: $typedMessage)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(minHeight: CGFloat(30))
                                Button(action: sendMessage) {
                                    Text("Send")
                                }
                            }.frame(minHeight: CGFloat(50)).padding()
        }
        .listStyle(.plain)
    }
    
    func sendMessage() {
        let newItem = ChatMessage(timestamp: Date(), sender: "you", recipient: botModel.name, message: typedMessage)
        modelContext.insert(newItem)
        MagicBallResponse()
        typedMessage = ""
        }
    
    func MagicBallResponse() {
        var replyList = [
        "Reply hazy, try again",
        "Ask again later",
        "Better not tell you now",
        "Cannot predict now",
        "Concentrate and ask again",
        ]
        
        if typedMessage.contains("?") {
            let newItem = ChatMessage(timestamp: Date(), sender: botModel.name, recipient: "you", message: replyList.randomElement() ?? "Try again")
            modelContext.insert(newItem)
        }
        
        
    }
}

#Preview {
    BotMessage(botModel: .init(name: "8Ball", desc: "Example", image: "https://play-lh.googleusercontent.com/ZVenIXKRp2y-E08fgB4m9pqsSgrbeS4bKehqbPBrxFOwcaqavIBoWFpBBndVO3w9BYE=w480-h960", logicID: "8Ball"))
        .modelContainer(for: ChatMessage.self, inMemory: true)
}
