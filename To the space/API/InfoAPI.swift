//
//  InfoAPI.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 08/11/21.
//

import Foundation

class InfoAPI: ObservableObject {
    @Published var results: SpaceXInfo?

    func loadData(completion:@escaping (SpaceXInfo?) -> ()) {
        guard let stringURL = ("https://api.spacexdata.com/v3/info").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: stringURL) else {
            print("Invalid url...")
            return
        }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil, let responseData = data {
                    do {
                        let decoder = JSONDecoder()
                        let infos = try decoder.decode(SpaceXInfo.self, from: responseData)
                        print(infos)
                        DispatchQueue.main.async {
                            completion(infos)
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
                    completion(nil)
                }
            }.resume()

        }
}
