//
//  WalletDataModel.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

struct WalletDataModel: Decodable {
    let accountId: String?
    let companyName: String?
    let amount: Amount?
    let creditDebitIndicator: String?
    let datetime: String?
    
    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case companyName = "company_name"
        case amount
        case creditDebitIndicator = "credit_debit_indicator"
        case datetime
    }
}

extension WalletDataModel {
    struct Amount: Decodable {
        let amount: Double?
        let currency: String?
        let name: String?
    }
}
