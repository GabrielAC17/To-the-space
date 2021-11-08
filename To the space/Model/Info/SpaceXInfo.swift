//
//  SpaceXInfo.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 07/11/21.
//

import Foundation

// MARK: - Welcome
struct SpaceXInfo: Codable {
    let name, founder: String?
    let founded, employees, vehicles, launchSites: Double?
    let testSites: Double?
    let ceo, cto, coo, ctoPropulsion: String?
    let valuation: Double?
    let headquarters: Headquarters?
    let links: InfoLinks?
    let summary: String?

    enum CodingKeys: String, CodingKey {
        case name, founder, founded, employees, vehicles
        case launchSites = "launch_sites"
        case testSites = "test_sites"
        case ceo, cto, coo
        case ctoPropulsion = "cto_propulsion"
        case valuation, headquarters, links, summary
    }
}
