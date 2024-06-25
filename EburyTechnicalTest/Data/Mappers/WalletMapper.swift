//
//  WalletMapper.swift
//  EburyTechnicalTest
//
//  Created by Sergio Ulloa López on 25/6/24.
//

struct WalletMapper {
    static func map(_ response: WalletDataModel) -> Wallet {
        return Wallet(id: response.accountId ?? "",
                      company: response.companyName ?? "",
                      currency: Currency(iso: response.amount?.currency ?? "",
                                         name: response.amount?.name ?? ""),
                      amount: response.amount?.amount ?? 0)
    }
}
