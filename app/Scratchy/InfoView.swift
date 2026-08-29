// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2026 Colin Rafferty <colin@rafferty.net>

import SwiftUI

struct InfoView: View {
    private let githubMarkdown =
        "[git@github.com:craffert0/scratchy]" +
        "(https://github.com/craffert0/scratchy)"
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

    @State private var showLicense: Bool = false

    var body: some View {
        Form {
            instructionsView
            copyrightView
        }
        .navigationTitle("Scratchy")
        .navigationBarTitleDisplayMode(.large)
    }

    private var instructionsView: some View {
        Section("") {
            ForEach(instructions, id: \.self) {
                Text($0.unwrapped)
                    .textSelection(.enabled)
            }
        }
    }

    private var copyrightView: some View {
        Section {
            Text(
                "Copyright © 2026 Colin Rafferty"
            )
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)

            Button("Licensed GNU GPLv2.0") {
                showLicense = true
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .sheet(isPresented: $showLicense) {
                LicenseView()
            }

            Text(
                try! AttributedString(markdown: githubMarkdown)
            )
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

#Preview {
    NavigationStack {
        InfoView()
    }
}
