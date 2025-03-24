// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2025 Colin Rafferty <colin@rafferty.net>

import SwiftData

@Model class ScratchModel {
    var text: String = ""

    init(_ text: String = "") {
        self.text = text
    }
}
