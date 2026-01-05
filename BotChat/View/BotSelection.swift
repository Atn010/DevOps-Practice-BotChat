//
//  BotSelection.swift
//  BotChat
//
//  Created by Antonius George on 05/01/26.
//

import SwiftUI
import SwiftData

struct BotSelection: View {
    @Environment(\.modelContext) private var modelContext
    var botModels: [BotModel] = [
        .init(name: "Magic 8 Ball bot", desc: "Example bot talk", image: "https://play-lh.googleusercontent.com/ZVenIXKRp2y-E08fgB4m9pqsSgrbeS4bKehqbPBrxFOwcaqavIBoWFpBBndVO3w9BYE=w480-h960", logicID: "8ball")
    ]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(botModels) { item in
                    NavigationLink {
                        BotMessage(botModel: item)
                            .modelContainer(for: ChatMessage.self, inMemory: false)
                    } label: {
                        HStack {
                            Image(item.image)
                            VStack {
                                Text(item.name)
                                Text(item.desc)
                            }
                            Spacer()
                        }
                    }
                }
            }
        } detail: {
            //Text("Select an item")
        }
    }

}

#Preview {
    BotSelection()
}
