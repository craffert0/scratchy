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
        modelContext.autosaveEnabled = true
    }

    var model: ScratchModel {
        // There must be a single ScratchModel, but we could have multiple out
        // there. So merge them. Poorly.
        let scratches =
            try! modelContext.fetch(FetchDescriptor<ScratchModel>())
        switch scratches.count {
        case 0:
            let new = ScratchModel()
            modelContext.insert(new)
            return new
        case 1:
            return scratches.first!
        default:
            let first = scratches.first!
            let extras = scratches.suffix(from: 1)
            var text = first.text
            for m in extras {
                text = "\n" + m.text
                modelContext.delete(m)
            }
            first.text = text
            return first
        }
    }
}
