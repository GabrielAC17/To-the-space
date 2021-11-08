//
//  InfoViewModel.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 08/11/21.
//

import Foundation

class InfoViewModel {
    public func getSpaceXInfo(completion:@escaping (String) -> ()) {
        let api = InfoAPI()

        api.loadData() { result in
            if result != nil {
                let name = result?.name ?? "SpaceX"
                let founder = result?.founder ?? "Elon Musk"
                let founded = result?.founded ?? 2002
                var first = true
                var text = "\(name) was founded by \(founder) in \(String(format: "%.0f", founded)). "

                if let employees = result?.employees, employees >= 0 {
                    text += "It has now \(String(format: "%.0f", employees)) employees"
                    first = false
                }
                else if (result?.employees == 0) {
                    text += "It has no employees"
                    first = false
                }

                if let launchSites = result?.launchSites {
                    text +=  first ? "It has \(String(format: "%.0f", launchSites)) launch sites" : ", \(String(format: "%.0f", launchSites)) launch sites"
                    first = false
                }

                if let value = result?.valuation {
                    text +=  first ? "It is valued at USD \(String(format: "%.0f", value))" : ", and is valued at USD \(String(format: "%.0f", value))"
                }

                completion(text)
            }
            else {
                completion("SpaceX was founded by Elon Musk in 2002.")
            }
        }
    }
}
