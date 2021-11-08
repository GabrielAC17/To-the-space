//
//  Timeline.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 07/11/21.
//

import Foundation

// MARK: - Timeline
struct Timeline: Codable {
    let webcastLiftoff: Double?

    enum CodingKeys: String, CodingKey {
        case webcastLiftoff = "webcast_liftoff"
    }
}
