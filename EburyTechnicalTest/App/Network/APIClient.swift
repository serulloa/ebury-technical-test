//
//  APIClient.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

import Foundation

struct APIClient {
    private let urlSession = URLSession.shared
    private let parser = Parser()
    
    func send<Request: Encodable, Response: Decodable>(_ request: Request = EmptyRequest(),
                                                       endpoint: APIEndpoint) async throws -> Response {
        let urlRequest = buildURLRequest(request, endpoint: endpoint.endpoint)
        let (data, _) = try await urlSession.data(for: urlRequest)
        return parser.parse(data, type: Response.self)!
    }
    
    private func buildURLRequest<Request: Encodable>(_ request: Request?, endpoint: Endpoint) -> URLRequest {
        let path = APIConstants.baseUrl + "/" + endpoint.path
        var urlRequest = URLRequest(url: URL(string: path)!)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        if endpoint.method != .GET {
            do {
                let body = try JSONEncoder().encode(request)
                urlRequest.httpBody = body
            } catch {
                print(error)
            }
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}
