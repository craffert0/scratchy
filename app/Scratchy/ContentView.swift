// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2025 Colin Rafferty <colin@rafferty.net>

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var models: [ScratchModel]

    var model: ScratchModel {
        // There must be a single ScratchModel, but we could have multiple
        // ones out there. So merge them. Poorly.
        switch models.count {
        case 0:
            let new = ScratchModel()
            modelContext.insert(new)
            return new
        case 1:
            return models.first!
        default:
            let first = models.first!
            let extras = models.suffix(from: 1)
            var text = first.text
            for m in extras {
                text = "\n" + m.text
                modelContext.delete(m)
            }
            first.text = text
            return first
        }
    }

    var body: some View {
        ScratchView(from: model)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ScratchModel.self, inMemory: true)
}
