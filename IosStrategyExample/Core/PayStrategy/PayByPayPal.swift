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
        guard let user = userEmail, user != String() else {
            throw PaymentErrors.userDataFailure(errorMessage: "Invalid User Email")
        }
        
        let userData = MockPayPalService.getUserData()
        
        guard MockPayPalService.validateUser(user: user, userData: userData) else {
            throw PaymentErrors.userDataFailure(errorMessage: "User email does not match")
        }
    }
    
    func pay(paymentAmount: Int) -> Bool {
        return MockPayPalService.payWithPayPal(amount: paymentAmount)
    }
}
