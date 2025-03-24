// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2025 Colin Rafferty <colin@rafferty.net>

import SwiftData
import SwiftUI

struct ScratchView: View {
    @Bindable var model = ScratchDataService.shared.model

    var body: some View {
        TextEditor(text: $model.text)
    }
}
