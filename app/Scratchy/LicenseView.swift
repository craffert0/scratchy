// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright (C) 2026 Colin Rafferty <colin@rafferty.net>

import SwiftUI

struct LicenseView: View {
    let text = LicenseModel.global.data

    var body: some View {
        ScrollView {
            VStack {
                Text(text)
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .navigationBarTitle("License")
    }
}

#Preview {
    NavigationStack {
        LicenseView()
    }
}
