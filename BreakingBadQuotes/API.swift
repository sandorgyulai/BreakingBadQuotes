//
//  API.swift
//  BreakingBadQuotes
//
//  Created by Sandor Gyulai on 26/11/2022.
//

import Foundation
import Alamofire
import Combine

struct API {

    enum Endpoint: String {
        case characters
        case quote
    }

    enum APIError: Error {
        case invalidURL
        case networkError(error: AFError)
    }

    static let shared = API()

    private let baseURL = URL(string: "https://www.breakingbadapi.com/api/")

    private let session: Session

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        session = Session(configuration: configuration)
    }
    
    func getData<T: Codable>(from endpoint: Endpoint, with parameters: Parameters? = nil) -> AnyPublisher<T, APIError> {

        guard let url = URL(string: endpoint.rawValue, relativeTo: baseURL) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }

        return session.request(url, parameters: parameters)
            .publishDecodable(type: T.self)
            .value()
            .mapError { APIError.networkError(error: $0) }
            .eraseToAnyPublisher()
    }

}
