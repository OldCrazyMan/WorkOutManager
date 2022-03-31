//
//  NetworkRequest.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 31.03.2022.
//

import Foundation


class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
    func request(completion: @escaping (Result<Data, Error>) -> Void) {
        
        let key = "7d2ce4c660d26aaf2122fccf890f187b"
        let latitude = 54.709070
        let longitude = 20.509280
        
        let urlString = "https://api.darksky.net/forecast/\(key)/\(latitude),\(longitude)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
