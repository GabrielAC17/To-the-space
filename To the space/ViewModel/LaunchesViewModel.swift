//
//  LaunchesViewModel.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 08/11/21.
//

import Foundation

class LaunchesViewModel {
    public func getSpaceXLaunches(completion:@escaping ([SpaceXLaunch]) -> ()) {
        let api = LaunchesAPI()

        api.loadData() { result in
            completion(result)
        }
    }
}
