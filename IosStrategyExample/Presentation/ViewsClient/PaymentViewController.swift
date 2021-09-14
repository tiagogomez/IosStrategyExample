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
    private var payPalStrategy = PayByPayPal()
    private var crediCardStrategy = PayByCreditCard()
    private var selectedRow: PaymentMethods?
    
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var payPalTextField: UITextField!
    
    enum PaymentMethods: Int, CaseIterable {
        
        case payPal
        case creditCard
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
    
    private func collectViewData() {
        let cost = Int(costTextField.text ?? "0") ?? 0
        order.setTotalCost(cost: cost)
        
        let paypalData = payPalTextField.text
        payPalStrategy.userEmail = paypalData
        
        let cvv = cvvTextField.text
        crediCardStrategy.cardCVV = cvv
    }
    
    func presentAlertMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func payButtonPressed(_ sender: Any) {
        /**
         * Client code
         */
        collectViewData()
        order.setClosed()
        do {
            try order.processOrder()
        } catch PaymentErrors.userDataFailure(let errorMessage) {
            presentAlertMessage(title: "User Data Failure", message: errorMessage)
        } catch {
            presentAlertMessage(title: "User Data Failure", message: "Unknow Error")
        }
        guard order.payOrder() else {
            presentAlertMessage(title: "Payment Failure", message: "No funds, poor")
            return
        }
        presentAlertMessage(title: "Success", message: "payment successful")
    }
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PaymentMethods.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case PaymentMethods.payPal.rawValue:
            cell.imageView?.image = UIImage(named: "PayPal")
            cell.textLabel?.text = "Pago PayPal"
            cell.accessoryType = (indexPath.row == selectedRow?.rawValue) ? .checkmark : .none
        case PaymentMethods.creditCard.rawValue:
            cell.imageView?.image = UIImage(named: "Visa")
            cell.textLabel?.text = "Pago Tarjeta"
            cell.accessoryType = (indexPath.row == selectedRow?.rawValue) ? .checkmark : .none
        default:
            cell.textLabel?.text = "Others"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = PaymentMethods(rawValue: indexPath.row)
        switch selectedRow {
        case .payPal:
            order.strategy = payPalStrategy
        case .creditCard:
            order.strategy = crediCardStrategy
        default:
            print("No payment selected")
        }
        tableView.reloadData()
    }
    
}
