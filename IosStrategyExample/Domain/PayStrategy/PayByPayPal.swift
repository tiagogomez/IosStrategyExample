//
//  PayByPayPal.swift
//  IosStrategyExample
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 26/08/21.
//

import Foundation

/**
 * Concrete strategy. Implements PayPal payment method.
 */
class PayByPayPal: PayStrategy {
    
    var email: String?
    var password: String?
    var isSignedIn: Bool?
    
    func collectPaymentDetails() throws {
        /**
        * Collect customer's data.
        */
    }
    
    func pay(paymentAmount: Int) -> Bool {
        /**
        * Save customer data for future shopping attempts.
        */
        return true
    }
}

enum PayPalErrors: Error {
    case UserError
}
