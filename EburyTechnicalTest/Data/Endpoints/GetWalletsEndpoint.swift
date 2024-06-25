//
//  GetWalletsEndpoint.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

struct GetWalletsEndpoint: Endpoint {
    var path: String = APIConstants.Endpoint.wallets
    var method: HTTPMethod = .GET
    var parameters: [String : AnyObject]? = nil
}
