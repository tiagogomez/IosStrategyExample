//
//  PaymentViewController.swift
//  IosStrategyExample
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 26/08/21.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var order = OrderContext()
    private var selectedStrategy: PayStrategy?
    private var selectedRow: PaymentMethods?
    
    
    enum PaymentMethods: Int, CaseIterable {
        
        case creditCard
        case payPal
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.isScrollEnabled = false
    }
    
    @IBAction func payButtonPressed(_ sender: Any) {
        /**
         * Client code
         */
        
        order.setTotalCost(cost: 10000)
        order.setClosed()
        order.processOrder()
        order.payOrder()
    }
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PaymentMethods.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case PaymentMethods.creditCard.rawValue:
            cell.imageView?.image = UIImage(named: "Visa")
            cell.textLabel?.text = "Pago Tarjeta"
            cell.accessoryType = (indexPath.row == selectedRow?.rawValue) ? .checkmark : .none
        case PaymentMethods.payPal.rawValue:
            cell.imageView?.image = UIImage(named: "PayPal")
            cell.textLabel?.text = "Pago PayPal"
            cell.accessoryType = (indexPath.row == selectedRow?.rawValue) ? .checkmark : .none
        default:
            cell.textLabel?.text = "Others"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = PaymentMethods(rawValue: indexPath.row)
        switch selectedRow {
        case .creditCard:
            selectedStrategy = PayByCreditCard()
        case .payPal:
            selectedStrategy = PayByPayPal()
        default:
            print("No payment selected")
        }
        order.strategy = selectedStrategy
        tableView.reloadData()
    }
    
}
