// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2025 Colin Rafferty <colin@rafferty.net>

import SwiftData
import SwiftUI

@main
struct ScratchyApp: App {
    let modelContainer: ModelContainer
    let context: Context

    init() {
        let schema = Schema([
            ScratchModel.self,
        ])
        let modelConfiguration =
            ModelConfiguration(schema: schema,
                               isStoredInMemoryOnly: false)

        modelContainer =
            try! ModelContainer(for: schema,
                                configurations: [modelConfiguration])
        context = .init(modelContext: modelContainer.mainContext)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(context: context)
        }
        .modelContainer(modelContainer)
    }
}
