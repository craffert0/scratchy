// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2025 Colin Rafferty <colin@rafferty.net>

import SwiftData

// https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches

class ScratchDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = ScratchDataService()

    @MainActor
    private init() {
        let schema = Schema([
            ScratchModel.self,
        ])
        let modelConfiguration =
            ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        modelContainer =
            try! ModelContainer(for: schema,
                                configurations: [modelConfiguration])
        modelContext = modelContainer.mainContext
    }

    var model: ScratchModel {
        // Force there to be a single Model
        let scratches = try! modelContext.fetch(FetchDescriptor<ScratchModel>())
        if let first = scratches.first {
            return first
        }
        let new = ScratchModel()
        modelContext.insert(new)
        return new
    }
}
