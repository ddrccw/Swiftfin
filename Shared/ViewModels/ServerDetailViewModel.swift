//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2023 Jellyfin & Jellyfin Contributors
//

import Foundation
import JellyfinAPI

class ServerDetailViewModel: ViewModel {

    @Published
    var server: ServerState

    init(server: ServerState) {
        self.server = server
    }

    func setServerCurrentURI(uri: String) {
        guard let currentURL = URL.init(string: uri) else { return }
        let newServerState = ServerState(urls: self.server.urls,
                                         currentURL: currentURL,
                                         name: self.server.name,
                                         id: self.server.id,
                                         os: self.server.os,
                                         version: self.server.version,
                                         usersIDs: self.server.userIDs)
        self.server = newServerState
        Notifications[.didChangeServerCurrentURI].post(object: newServerState)
//        SessionManager.main.setServerCurrentURI(server: server, uri: uri)
//            .sink { c in
//                print(c)
//            } receiveValue: { newServerState in
//                self.server = newServerState
//
//                Notifications[.didChangeServerCurrentURI].post(object: newServerState)
//            }
//            .store(in: &cancellables)
    }
}
