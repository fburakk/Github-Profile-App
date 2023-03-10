//
//  NetworkManager.swift
//  githubProfile
//
//  Created by Burak Köse on 6.02.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func makeRequest<T:Codable>(endpoint:Endpoint,
                            type:T.Type,
                            completed: @escaping (Result<T,GPError>) -> Void) {
        
        let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        AF.request(endpoint.url,method: .get)
            .validate()
            .responseDecodable(of: T.self,decoder: decoder) { response in
                
                guard let user = response.value else {
                    completed(.failure(.invalidRequest))
                    return
                }
                completed(.success(user))
            }
    }
}
