//
//  Environment.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation

enum Environment {
    case web
    case mock

    static var state = Environment.web

    static func setEnvState() {
#if MOCK
        self.state = .mock
#elseif WEB
        self.state = .web
#else
        preconditionFailure("Unknown envirement. Please check your configurations")
#endif
    }

    static var isMock: Bool {
        return state == Environment.mock
    }
}
