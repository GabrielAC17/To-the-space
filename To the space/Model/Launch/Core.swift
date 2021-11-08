//
//  Core.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 07/11/21.
//

import Foundation

// MARK: - Core
struct Core: Codable {
    let coreSerial: String?
    let flight: Double?
    let gridfins, legs, reused: Bool?
    let landingIntent: Bool?

    enum CodingKeys: String, CodingKey {
        case coreSerial = "core_serial"
        case flight, gridfins, legs, reused
        case landingIntent = "landing_intent"
    }
}
