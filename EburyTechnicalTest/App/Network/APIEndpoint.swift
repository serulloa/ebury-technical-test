//
//  APIEndpoints.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

enum APIEndpoint {
    case getWallets
    
    public var endpoint: Endpoint {
        switch self {
        case .getWallets:
            return GetWalletsEndpoint()
        }
    }
}
