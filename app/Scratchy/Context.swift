// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2026 Colin Rafferty <colin@rafferty.net>

import Foundation
import SwiftData

private let kDebounceInterval = 2.0

class Context {
    private let modelContext: ModelContext
    private var timer: Timer?

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func insert(_ model: ScratchModel) {
        modelContext.insert(model)
    }

    func delete(_ model: ScratchModel) {
        modelContext.delete(model)
    }

    func save() {
        guard timer == nil else { return }

        timer = .scheduledTimer(
            withTimeInterval: kDebounceInterval,
            repeats: false
        ) { _ in
            self.timer = nil
            self.forceSave()
        }
    }

    func forceSave() {
        timer?.invalidate()
        timer = nil
        try? modelContext.save()
    }
}
