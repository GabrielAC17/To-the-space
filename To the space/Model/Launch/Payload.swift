//
//  Payload.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 07/11/21.
//

import Foundation

// MARK: - Payload
struct Payload: Codable {
    let payloadID: String?
    let reused: Bool?
    let customers: [String]?
    let nationality, manufacturer, payloadType: String?
    let payloadMassKg, payloadMassLbs: Double?
    let orbit: String?
    let orbitParams: OrbitParams?

    enum CodingKeys: String, CodingKey {
        case payloadID = "payload_id"
        case reused, customers, nationality, manufacturer
        case payloadType = "payload_type"
        case payloadMassKg = "payload_mass_kg"
        case payloadMassLbs = "payload_mass_lbs"
        case orbit
        case orbitParams = "orbit_params"
    }
}
