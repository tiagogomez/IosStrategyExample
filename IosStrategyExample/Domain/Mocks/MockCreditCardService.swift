//
//  MockCreditCardService.swift
//  IosStrategyExample
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 14/09/21.
//

import Foundation

class MockCreditCardService {
    
    static let creditCardData = CreditCard(number: "311341", date: Date(), cvv: "666")
    
    static func getCreditCardData() -> CreditCard {
        return creditCardData
    }
    
    static func validateCVV(cvv: String, creditCard: CreditCard) -> Bool {
        return creditCard.cvv == cvv
    }
    
    static func payWithCard(amount: Int) -> Bool {
        return amount < 100000 
    }
}
