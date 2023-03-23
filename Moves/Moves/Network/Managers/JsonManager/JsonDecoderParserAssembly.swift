//
//  JsonDecoderParserAssembly.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import Foundation
import Swinject

struct JsonDecoderParserAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Parsing.self) { _ in JsonDecoderParser() }
    }
}
