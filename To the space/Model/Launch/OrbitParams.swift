//
//  OrbitParams.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 07/11/21.
//

import Foundation

// MARK: - OrbitParams
struct OrbitParams: Codable {
    let referenceSystem, regime: String?
    let periapsisKM, apoapsisKM, inclinationDeg: Double?

    enum CodingKeys: String, CodingKey {
        case referenceSystem = "reference_system"
        case regime
        case periapsisKM = "periapsis_km"
        case apoapsisKM = "apoapsis_km"
        case inclinationDeg = "inclination_deg"
    }
}
