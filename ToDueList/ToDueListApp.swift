//
//  ToDueListApp.swift
//  ToDueList
//
//  Created by Matthew Low on 2024-01-15.
//

import SwiftUI
import SwiftData

@main
struct ToDueListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TaskItem.self)
    }
}
