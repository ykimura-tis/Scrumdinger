//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by 木村幸敏 on 2024/12/31.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String

    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
