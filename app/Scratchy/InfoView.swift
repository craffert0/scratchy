// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2026 Colin Rafferty <colin@rafferty.net>

import SwiftUI
import SwiftUIUtil
import SwiftUIUtilModel

struct InfoView: View {
    private let instructions = [
        """
        Type any text on this device, and it will be updated on all your
        other devices.
        """,
        """
        All text sharing is done via iCloud, and
        no data is uploaded to any other servers.
        """,
    ]

    var body: some View {
        SwiftUIUtil.InfoView(
            title: "Scritchy",
            repo: .github(user: "craffert0", repo: "scratchy"),
            copyright: "2026 Colin Rafferty",
            license: .gplV2,
            instructions: instructions
        )
    }
}

#Preview {
    NavigationStack {
        InfoView()
    }
}
