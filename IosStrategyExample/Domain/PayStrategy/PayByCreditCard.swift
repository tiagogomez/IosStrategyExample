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
    
    var cardCVV: String?
    
    func collectPaymentDetails() throws {

        guard let cvv = cardCVV else {
            print("Failure")
            return
        }
        
        let card = MockCreditCardService.getCreditCardData()
        guard MockCreditCardService.validateCVV(cvv: cvv, creditCard: card) else {
            print("Failure")
            return
        }
    }
    
    func pay(paymentAmount: Int) -> Bool {
        return MockCreditCardService.payWithCard(amount: paymentAmount)
    }
}
