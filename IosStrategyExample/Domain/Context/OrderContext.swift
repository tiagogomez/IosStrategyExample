//
//  OrderContext.swift
//  IosStrategyExample
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 26/08/21.
//

import Foundation

/**
 * Order class. Doesn't know the concrete payment method (strategy) user has
 * picked. It uses common strategy interface to delegate collecting payment data
 * to strategy object. It can be used to save order to database.
 */
class OrderContext {
    
    private(set) var totalCost: Int?
    private(set) var isClosed: Bool = false
    var strategy: PayStrategy?
    
    func processOrder() {
        try? strategy?.collectPaymentDetails()
    }
    
    func payOrder() {
        _ = strategy?.pay(paymentAmount: totalCost ?? 0)
    }
    
    func setTotalCost(cost: Int) {
        self.totalCost = cost
    }
    
    func setClosed() {
        self.isClosed = true
    }
}

