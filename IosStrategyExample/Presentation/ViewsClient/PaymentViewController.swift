//
//  PaymentViewController.swift
//  IosStrategyExample
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 26/08/21.
//

import UIKit

class PaymentViewController: UIViewController {
    
    private var order = OrderContext()

    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         * Client code
         */
        let payPalStrategy = PayByPayPal()
        let creditCardStrategy = PayByCreditCard()
        
        // Choose strategy
        order.setTotalCost(cost: 10000)
        order.setClosed()
        order.strategy = payPalStrategy
        order.processOrder()
        order.payOrder()
        
        order.strategy = creditCardStrategy
        order.processOrder()
        order.payOrder()
    }
}

