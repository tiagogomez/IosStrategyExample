//
//  CreditCard.swift
//  IosStrategyExample
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 26/08/21.
//

import Foundation

struct CreditCard {
    
    private(set) var amount: Int?
    let number: String
    let date: Date
    let cvv: String
    
    mutating func setCardAmount(_ amount: Int) {
        self.amount = amount
    }
}
