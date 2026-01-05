//
//  BotChatApp.swift
//  BotChat
//
//  Created by Antonius George on 05/01/26.
//

import SwiftUI
import SwiftData

@main
struct BotChatApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ChatMessage.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            BotSelection()
        }
        .modelContainer(sharedModelContainer)
    }
}
