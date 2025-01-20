//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import Stinsen
import SwiftUI

extension VideoPlayer {
    struct SettingsOverlay: View {

        @Environment(\.safeAreaInsets)
        private var safeAreaInsets

        var body: some View {
            HStack {
                Spacer()
                NavigationViewCoordinator(PlaybackSettingsCoordinator()).view()
                    .frame(width: 400)
                    .padding(.trailing, safeAreaInsets.trailing)
                    .padding(.vertical)
                    .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                    .ignoresSafeArea()
            }
            .background(Color.clear)
            .ignoresSafeArea()
        }
    }
}
