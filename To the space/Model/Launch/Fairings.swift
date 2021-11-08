//
//  Fairings.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 07/11/21.
//

import Foundation

// MARK: - Fairings
struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered
    }
}
