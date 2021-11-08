//
//  LaunchesAPI.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 08/11/21.
//

import Foundation

class LaunchesAPI: ObservableObject {
    @Published var results = [SpaceXLaunch]()

    func loadData(completion:@escaping ([SpaceXLaunch]) -> ()) {
        guard let stringURL = ("https://api.spacexdata.com/v3/launches").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: stringURL) else {
            print("Invalid url...")
            return
        }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil, let responseData = data {
                    do {
                        let decoder = JSONDecoder()
                        let launches = try decoder.decode([SpaceXLaunch].self, from: responseData)
                        print(launches)
                        DispatchQueue.main.async {
                            completion(launches)
                        }
                    } catch DecodingError.dataCorrupted(let context) {
                        print(context)
                    } catch DecodingError.keyNotFound(let key, let context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch DecodingError.valueNotFound(let value, let context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch DecodingError.typeMismatch(let type, let context) {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }

                }
                else{
                    completion([])
                }
            }.resume()

        }
}
