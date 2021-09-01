//
//  PayByCreditCard.swift
//  IosStrategyExample
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 26/08/21.
//

import Foundation

/**
 * Concrete strategy. Implements credit card payment method.
 */
class PayByCreditCard: PayStrategy {
    
    var card: CreditCard?
    
    func collectPaymentDetails() throws {
        /**
        * Collect credit card data.
        */
        card = CreditCard(number: "311341", date: Date(), cvv: "Holi")
    }
    
    func pay(paymentAmount: Int) -> Bool {
        /**
        * After card validation we can charge customer's credit card.
        */
        return true
    }
}
