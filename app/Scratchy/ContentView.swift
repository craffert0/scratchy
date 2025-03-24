// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2025 Colin Rafferty <colin@rafferty.net>

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        ScratchView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ScratchModel.self, inMemory: true)
}
