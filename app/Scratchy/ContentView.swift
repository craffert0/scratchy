// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2025 Colin Rafferty <colin@rafferty.net>

import SwiftData
import SwiftUI

struct ContentView: View {
    var context: Context
    @Query private var models: [ScratchModel]

    var model: ScratchModel {
        // There must be a single ScratchModel, but we could have multiple
        // ones out there. So merge them. Poorly.
        switch models.count {
        case 0:
            let new = ScratchModel()
            context.insert(new)
            context.forceSave()
            return new
        case 1:
            return models.first!
        default:
            let first = models.first!
            let extras = models.suffix(from: 1)
            var text = first.text
            for m in extras {
                text = "\n" + m.text
                context.delete(m)
            }
            first.text = text
            context.forceSave()
            return first
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                ScratchView(from: model)
                infoView
            }
        }
        .onChange(of: model.text) {
            context.save()
        }
    }

    private var infoView: some View {
        NavigationLink {
            InfoView()
        } label: {
            Label("", systemImage: "info.circle")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,
               alignment: .topTrailing)
    }
}
