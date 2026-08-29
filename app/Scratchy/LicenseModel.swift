// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2026 Colin Rafferty <colin@rafferty.net>

import Foundation

class LicenseModel {
    static let global = LicenseModel()

    lazy var data: String = load() ?? "GPLv2"

    private func load() -> String? {
        guard let filepath = Bundle.main.path(forResource: "LICENSE",
                                              ofType: "txt")
        else {
            return nil
        }
        return try? String(contentsOfFile: filepath,
                           encoding: .utf8)
    }
}
