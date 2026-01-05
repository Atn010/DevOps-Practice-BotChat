//
//  BotModel.swift
//  BotChat
//
//  Created by Antonius George on 05/01/26.
//

import Foundation
import SwiftData

@Model
final class BotModel {
    public init(name: String, desc: String, image: String, logicID: String) {
        self.name = name
        self.desc = desc
        self.image = image
        self.logicID = logicID
    }
    
    var name: String
    var desc: String
    var image: String
    var logicID: String

    
}
