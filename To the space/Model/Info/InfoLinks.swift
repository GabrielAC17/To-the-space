//
//  InfoLinks.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 08/11/21.
//

import Foundation

// MARK: - Links
struct InfoLinks: Codable {
    let website, flickr, twitter, elonTwitter: String?

    enum CodingKeys: String, CodingKey {
        case website, flickr, twitter
        case elonTwitter = "elon_twitter"
    }
}
