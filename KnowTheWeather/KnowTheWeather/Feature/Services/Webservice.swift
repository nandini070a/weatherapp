//
//  Webservice.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-03.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case domainError
    case decodingError
}

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

class Webservice {
    func fetch<T>(resource: Resource<T>, completionHandler: @escaping (Result<T?, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(.urlError))
                return
            }
            DispatchQueue.main.async {
                completionHandler(.success(resource.parse(data)))
            }
        }.resume()
    }
}
