//
//  PayStrategy.swift
//  IosStrategyExample
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 26/08/21.
//

import Foundation

/**
 * Common interface for all strategies.
 */
protocol PayStrategy {
    
    func collectPaymentDetails() throws
    func pay(paymentAmount: Int) -> Bool
}
