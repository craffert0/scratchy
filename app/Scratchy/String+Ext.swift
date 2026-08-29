// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2026 Colin Rafferty <colin@rafferty.net>

public extension String {
    var unwrapped: String {
        replacingOccurrences(of: "\n\n", with: "XYZZY")
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "XYZZY", with: "\n\n")
    }
}
