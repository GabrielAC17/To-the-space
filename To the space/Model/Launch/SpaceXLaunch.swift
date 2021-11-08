//
//  SpaceXLaunch.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 07/11/21.
//

import Foundation

// MARK: - Welcome
struct SpaceXLaunch: Codable, Identifiable {
    let id = UUID()
    let flightNumber: Double?
    let missionName: String?
    let upcoming: Bool?
    let launchYear: String?
    let launchDateUnix: Double?
    let launchDateUTC: String?
    let launchDateLocal: String?
    let isTentative: Bool?
    let tentativeMaxPrecision: String?
    let tbd: Bool?
    let launchWindow: Double?
    let rocket: Rocket?
    let telemetry: Telemetry?
    let launchSite: LaunchSite?
    let launchSuccess: Bool?
    let launchFailureDetails: LaunchFailureDetails?
    let links: Links?
    let details, staticFireDateUTC: String?
    let staticFireDateUnix: Double?
    let timeline: Timeline?

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case upcoming
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUTC = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case isTentative = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case tbd
        case launchWindow = "launch_window"
        case rocket, telemetry
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case launchFailureDetails = "launch_failure_details"
        case links, details
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case timeline
    }
}
