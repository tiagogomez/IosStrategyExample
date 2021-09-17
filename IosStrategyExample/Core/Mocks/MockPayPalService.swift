//
//  MockPayPalService.swift
//  IosStrategyExample
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 14/09/21.
//

import Foundation

class MockPayPalService {
    
    static let userData = UserData(email: "santiago@gmail", password: "12345", isSignedIn: true)
    
    static func getUserData() -> UserData {
        return userData
    }
    
    static func validateUser(user: String, userData: UserData) -> Bool {
        return userData.email == user
    }
    
    static func payWithPayPal(amount: Int) -> Bool {
        return amount <= 100
    }
}
