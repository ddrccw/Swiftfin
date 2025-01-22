//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import SwiftUI
import UIKit

struct FontPickerView: View {

    @Binding
    private var selection: String

    private let fonts: [String]

    init(selection: Binding<String>) {
        self._selection = selection
        let customFont = "Microsoft YaHei"
        var fonts = UIFont.familyNames
        if fonts.contains(customFont) {
            fonts = fonts.filter { $0 != customFont }
            fonts.insert(customFont, at: 0)
        }
        self.fonts = fonts
    }

    var body: some View {
        SelectorView(
            selection: $selection,
            sources: fonts
        )
        .label { fontFamily in
            Text(fontFamily)
                .foregroundColor(.primary)
                .font(.custom(fontFamily, size: 18))
        }
        .navigationTitle("Font")
    }
}
