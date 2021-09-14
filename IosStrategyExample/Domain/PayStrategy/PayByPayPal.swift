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
    
    var userEmail: String?
    
    func collectPaymentDetails() throws {
        guard let user = userEmail else {
            print("Failure")
            return
        }
        
        let userData = MockPayPalService.getUserData()
        
        guard MockPayPalService.validateUser(user: user, userData: userData) else {
            print("Failure")
            return
        }
    }
    
    func pay(paymentAmount: Int) -> Bool {
        return MockPayPalService.payWithPayPal(amount: paymentAmount)
    }
}

enum PayPalErrors: Error {
    case UserError
}
