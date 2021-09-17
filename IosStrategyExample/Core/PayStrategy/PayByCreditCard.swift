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
        guard let cvv = cardCVV, cvv != String() else {
            throw PaymentErrors.userDataFailure(errorMessage: "Invalid CVV")
        }
        
        let card = MockCreditCardService.getCreditCardData()
        guard MockCreditCardService.validateCVV(cvv: cvv, creditCard: card) else {
            throw PaymentErrors.userDataFailure(errorMessage: "CVV does not match")
        }
    }
    
    func pay(paymentAmount: Int) -> Bool {
        return MockCreditCardService.payWithCard(amount: paymentAmount)
    }
}
