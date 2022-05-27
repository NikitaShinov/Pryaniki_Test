//
//  NetworkManager.swift
//  Pryaniki_Test
//
//  Created by max on 27.05.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private init() {}
    
    static func fetchData(completion: @escaping(_ result: ResponseData) -> Void) {
        AF.request(Constants.url).response { data in
            guard let data = data.data else { return }
            do {
                let decodedData = try JSONDecoder().decode(ResponseData.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print (error.localizedDescription)
            }
        }
    }
}
